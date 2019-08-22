#include <stdio.h>
#include <errno.h>
#include <stdlib.h>
#include <unistd.h>
#include <string.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <sys/un.h>
#include <netinet/in.h>
#include <arpa/inet.h>
#include <netdb.h>
#include <ctype.h>
#include <time.h>
#include <signal.h> 
#include <stdarg.h>
#include <errno.h>
#include <assert.h>

#include "threadpool.h"
#include "http_parser.h"
#include "uthash.h"
#include "curlthread.h"

#define array_size(x) (sizeof(x) / sizeof(x[0]))

#define MAX_DEBUG_LINE 128

#define UH_LIMIT_HEADERS  128
#define UH_HTTP_MSG_GET   0
#define UH_HTTP_MSG_HEAD  1
#define UH_HTTP_MSG_POST  2

#define SOCK_PATH "/tmp/uds"

#define THREAD 8
#define QUEUE 512

#define foreach_header(i, h) for( i = 0; (i + 1) < (sizeof(h) / sizeof(h[0])) && h[i]; i += 2 )

static unsigned int client_counter=1;
unsigned int client_id[FD_SETSIZE]={0};
int socket_type[FD_SETSIZE]={0};
threadData tData[FD_SETSIZE]={0};
pthread_t threadId[FD_SETSIZE]={0};
static int max_fd=0;


typedef struct client_struct {
  char ip[MAXIP]; //key
  char mac[MAXMAC];
  time_t ts;
  UT_hash_handle hh;         /* makes this structure hashable */
} client_struct;

typedef struct mac_struct {
  char mac[MAXMAC];
  time_t ts;
  UT_hash_handle hh;         /* makes this structure hashable */
} mac_struct;

typedef struct _http_request {
  int method;
  float version;
  int redirect_status;
  char *url;
  char *headers[UH_LIMIT_HEADERS];
} http_request;

client_struct* client_list=NULL;
static http_request sHttpReq;
char mac[MAXMAC]= {0};
char local_req[48]= {0};
uint16_t port;
char *node_mac=NULL;
char *node_id=NULL;
char *server_url=NULL;
char *address=NULL;
FILE *fp=NULL;
uint32_t SESSION_TRACKER=0;
mac_struct* mac_auth_cache=NULL;

#define log_printf printf

void file_printf(const char *fmt, ...) {
    va_list args;

    if(SESSION_TRACKER==0) {
      if (fp) {
        fclose(fp);
        fp=NULL;
      }
      system("mv /tmp/uhttpd.log /tmp/uhttpd.log.bak 2>/dev/null");
      fp=fopen ("/tmp/uhttpd.log","w+");
    }

    va_start(args, fmt);
    vfprintf(fp, fmt, args);
    va_end(args);

    SESSION_TRACKER++;

    if (SESSION_TRACKER > 30000) {
      SESSION_TRACKER=0;
    }
}

int is_mac_hit(char *cache_mac) {
    mac_struct *s=NULL;

    HASH_FIND_STR( mac_auth_cache, cache_mac, s );  /* s: output pointer */
    if (s==NULL) {
      return 0;
    }
    else {
        time_t now=time(NULL);
        if ((now - s->ts) > 60) {
          return 0;
        }
    }
    return 1;
}

void add_mac_cache(char *cache_mac, time_t ts) {
    mac_struct *s=NULL;

    HASH_FIND_STR( mac_auth_cache, cache_mac, s );  /* s: output pointer */
    if (s==NULL) {
      s=malloc(sizeof(struct mac_struct));
      snprintf(s->mac, sizeof(s->mac), "%s", cache_mac);
      s->ts=ts;
      HASH_ADD_STR(mac_auth_cache, mac, s);  /* id: name of key field */
    }   
    else {
      s->ts=ts;
    }
}

void flush_mac_cache(int *cache_mac) {
}

void print_mac_cache() {
  struct mac_struct *entry, *tmp;

  log_printf("mac cache list, ts:%llu\n", (long long) time(NULL));
  HASH_ITER(hh, mac_auth_cache, entry, tmp) {
    log_printf("mac:%s, ts:%llu\n", entry->mac, (long long) entry->ts);
  }
}

char *strfind(char *haystack, int hslen, const char *needle, int ndlen)
{
  int match = 0;
  int i, j;

  for( i = 0; i < hslen; i++ ) {
    if( haystack[i] == needle[0] ) {
      match = ((ndlen == 1) || ((i + ndlen) <= hslen));

      for( j = 1; (j < ndlen) && ((i + j) < hslen); j++ ) {
        if( haystack[i+j] != needle[j] ) {
          match = 0;
          break;
        }
      }

      if( match )
        return &haystack[i];
    }
  }

  return NULL;
}

void http_bad_response(int filedes, uint32_t code, char *summary)
{
  char buffer[MAXMSG];
  int len;

  len = snprintf(buffer, sizeof(buffer),
                 "HTTP/1.1 %03i %s\r\n"
                 "Connection: close\r\n"
                 "Content-Type: text/plain\r\n\r\n"
                 "Bad request",
                 code, summary);
  send(filedes, buffer, len, 0);
}

static int do_sys_command(char* cmd)
{
  FILE *fp;

  memset(mac, 0x0, sizeof(mac));
  fp = popen(cmd, "r");
  if (fp != NULL) {
    //Read the output a line at a time - output it.
    if (fgets(mac, sizeof(mac), fp)==NULL) {
      pclose(fp);
      return 0;
    }
  } else {
    return 0;
  }
  //close
  pclose(fp);
  return 1;
}

void make_redir_response(int filedes)
{
  char client_ip[MAXIP]= {0};
  socklen_t addr_size=sizeof(struct sockaddr_in);
  struct sockaddr_in addr;
  int res= getpeername(filedes, (struct sockaddr*)&addr, &addr_size);
  int i=0;

  strcpy(client_ip, inet_ntoa(addr.sin_addr));
  foreach_header(i, sHttpReq.headers) {
    if (!strcasecmp(sHttpReq.headers[i], "Host")) {
      char cmd[128]= {0};
      memset(cmd, 0x0, sizeof(cmd));
      snprintf(cmd, sizeof(cmd)-1, "arp -a -n %s | awk '{printf $4}'", client_ip);
      client_struct *s=NULL, *tmp = NULL;
      HASH_FIND_STR( client_list, client_ip, s);
      if (!s) {
        if (do_sys_command(cmd)) {
          if (strlen(mac)==17) {
            //add to hash table
            s = (client_struct*)malloc(sizeof(client_struct));
            strncpy(s->ip, client_ip, MAXIP);
            strncpy(s->mac, mac, MAXMAC);
            s->ts=time(NULL);
            HASH_ADD_STR( client_list, ip, s );
          }
        }
      } else {
        //check timestamp
        time_t now=time(NULL);
        if ((now - s->ts) > 600) {
          if (do_sys_command(cmd)) {
            if (strlen(mac)==17) {
              strncpy(s->mac, mac, MAXMAC);
              s->ts=now;
            }
          }
        }
        strncpy(mac, s->mac, MAXMAC);
      }

      memset(tData[filedes].redirect_url, 0x0, sizeof(tData[filedes].redirect_url));
      snprintf(tData[filedes].redirect_url, sizeof(tData[filedes].redirect_url)-1,
               "%s?node_id=%s&gateway_id=%s&node_mac=%s&client_mac=%s&client_ip=%s&ssid=%s&cont_url=http://%s%s",
               server_url, node_id, "test", node_mac, mac, client_ip, "1", sHttpReq.headers[i+1], sHttpReq.url);
      log_printf("%s\n", tData[filedes].redirect_url);

      if (!strcasecmp(sHttpReq.headers[i+1], local_req) && !strcasecmp(sHttpReq.url, "/dumpinfo")) {
        //dump
        log_printf("===========================================================");
        char debug_line[MAX_DEBUG_LINE];
        HASH_ITER(hh, client_list, s, tmp) {
          snprintf(debug_line, sizeof(debug_line), "ip:%s, mac:%s, ts:%d", s->ip, s->mac, (uint32_t)s->ts);
          log_printf("%s\n", debug_line);
        }
      }
    }//Host
  }//foreach_header
}




void http_redir_response(int filedes)
{

  char buffer[MAXMSG];
  char redirect_url[MAXURLMSG];
  int len;
  char client_ip[MAXIP]= {0};
  socklen_t addr_size=sizeof(struct sockaddr_in);
  struct sockaddr_in addr;
  int res= getpeername(filedes, (struct sockaddr*)&addr, &addr_size);
  int i=0;

  strcpy(client_ip, inet_ntoa(addr.sin_addr));
  foreach_header(i, sHttpReq.headers) {
    if (!strcasecmp(sHttpReq.headers[i], "Host")) {
      char cmd[128]= {0};
      memset(cmd, 0x0, sizeof(cmd));
      snprintf(cmd, sizeof(cmd)-1, "arp -a -n %s | awk '{printf $4}'", client_ip);
      client_struct *s=NULL, *tmp = NULL;
      HASH_FIND_STR( client_list, client_ip, s);
      if (!s) {
        if (do_sys_command(cmd)) {
          if (strlen(mac)==17) {
            //add to hash table
            s = (client_struct*)malloc(sizeof(client_struct));
            strncpy(s->ip, client_ip, MAXIP);
            strncpy(s->mac, mac, MAXMAC);
            s->ts=time(NULL);
            HASH_ADD_STR( client_list, ip, s );
          }
        }
      } else {
        //check timestamp
        time_t now=time(NULL);
        if ((now - s->ts) > 600) {
          if (do_sys_command(cmd)) {
            if (strlen(mac)==17) {
              strncpy(s->mac, mac, MAXMAC);
              s->ts=now;
            }
          }
        }
        strncpy(mac, s->mac, MAXMAC);
      }

      memset(redirect_url, 0x0, sizeof(redirect_url));
      snprintf(redirect_url, sizeof(redirect_url)-1,
               "%s?node_id=%s&gateway_id=%s&node_mac=%s&client_mac=%s&client_ip=%s&ssid=%s&cont_url=http://%s%s",
               server_url, node_id, "test", node_mac, mac, client_ip, "1", sHttpReq.headers[i+1], sHttpReq.url);
      log_printf("%s\n", redirect_url);

      len = snprintf(buffer, sizeof(buffer),
                     "HTTP/1.1 200 OK\r\n"
                     "Connection: close\r\n"
                     "Content-Type: text/html\r\n"
                     "Pragma: no-cache\r\n"
                     "Expires: -1\r\n\r\n"
                     "<script>window.location.href='%s'</script>", redirect_url
                    );
      send(filedes, buffer, len, 0);

      if (!strcasecmp(sHttpReq.headers[i+1], local_req) && !strcasecmp(sHttpReq.url, "/dumpinfo")) {
        //dump
        log_printf("===========================================================");
        char debug_line[MAX_DEBUG_LINE];
        HASH_ITER(hh, client_list, s, tmp) {
          snprintf(debug_line, sizeof(debug_line), "ip:%s, mac:%s, ts:%d", s->ip, s->mac, (uint32_t)s->ts);
          log_printf("%s\n", debug_line);
        }
      }
    }
  }
}

int http_header_parse(int filedes, char *buffer, int buflen)
{
  char *method  = &buffer[0];
  char *path    = NULL;
  char *version = NULL;

  char *headers = NULL;
  char *hdrname = NULL;
  char *hdrdata = NULL;

  int i;

  int hdrcount = 0;

  memset(&sHttpReq, 0, sizeof(sHttpReq));

  /* terminate initial header line */
  if( (headers = strfind(buffer, buflen, "\r\n", 2)) != NULL ) {
    buffer[buflen-1] = 0;

    *(headers++) = 0;
    *(headers++) = 0;

    /* find request path */
    if( (path = strchr(buffer, ' ')) != NULL ) {
      *(path++) = 0;
    } else {
      http_bad_response(filedes, 400, "Bad Request: URL Request Path Not Found");
      return -1;
    }

    /* find http version */
    if( (path != NULL) && ((version = strchr(path, ' ')) != NULL) ) {
      *(version++) = 0;
    } else {
      http_bad_response(filedes, 400, "Bad Request: HTTP Version Not Found");
      return -1;
    }

    /* check method */
    if( strcmp(method, "GET") && strcmp(method, "HEAD") && strcmp(method, "POST") ) {
      /* invalid method */
      http_bad_response(filedes, 405, "Method Not Allowed");
      return -1;
    } else {
      switch(method[0]) {
      case 'G':
        sHttpReq.method = UH_HTTP_MSG_GET;
        break;

      case 'H':
        sHttpReq.method = UH_HTTP_MSG_HEAD;
        break;

      case 'P':
        sHttpReq.method = UH_HTTP_MSG_POST;
        break;
      }
    }

    /* check path */
    if( !path || !strlen(path) ) {
      /* malformed request */
      http_bad_response(filedes, 400, "Bad Request");
      return -1;
    } else {
      sHttpReq.url = path;
    }

    /* check version */
    if( (version == NULL) || (strcmp(version, "HTTP/0.9") &&
                              strcmp(version, "HTTP/1.0") && strcmp(version, "HTTP/1.1")) ) {
      /* unsupported version */
      http_bad_response(filedes, 400, "Bad Request");
      return -1;
    } else {
      sHttpReq.version = strtof(&version[5], NULL);
    }

    /* process header fields */
    for( i = (int)(headers - buffer); i < buflen; i++ ) {
      /* found eol and have name + value, push out header tuple */
      if( hdrname && hdrdata && (buffer[i] == '\r' || buffer[i] == '\n') ) {
        buffer[i] = 0;

        /* store */
        if( (hdrcount + 1) < array_size(sHttpReq.headers) ) {
          sHttpReq.headers[hdrcount++] = hdrname;
          sHttpReq.headers[hdrcount++] = hdrdata;
          hdrname = hdrdata = NULL;
        }
        /* too large */
        else {
          http_bad_response(filedes, 413, "Request Entity Too Large");
          return -1;
        }
      }
      /* have name but no value and found a colon, start of value */
      else if( hdrname && !hdrdata && ((i+1) < buflen) && (buffer[i] == ':') ) {
        buffer[i] = 0;
        hdrdata = &buffer[i+1];

        //skip space after ":"
        while ((hdrdata + 1) < (buffer + buflen) && *hdrdata == ' ') {
          hdrdata++;
        }
      }
      /* have no name and found [A-Za-z], start of name */
      else if (!hdrname && isalpha(buffer[i])) {
        hdrname = &buffer[i];
      }
    }

    /* valid enough */
    sHttpReq.redirect_status = 200;
    return 0;
  }

  /* Malformed request */
  http_bad_response(filedes, 400, "Bad Request");
  return -1;
}

int createDomainSocket() {
  int domainSocket=0;
  struct sockaddr_un address;

  unlink(SOCK_PATH);
  //create a master socket
  if( (domainSocket = socket(AF_UNIX , SOCK_STREAM , 0)) == 0)  
  {
      perror("socket failed");
      exit(EXIT_FAILURE);
  }
  
  
   //type of socket created
  address.sun_family = AF_UNIX;
  strcpy(address.sun_path, SOCK_PATH);
    
  size_t len = strlen(address.sun_path) + sizeof(address.sun_family);
  
  if (bind(domainSocket, (struct sockaddr *)&address, len)<0) 
  {
      perror("bind failed");
      exit(EXIT_FAILURE);
  }
  log_printf("Listener on port %s \n", SOCK_PATH);

  if (listen(domainSocket, 32) < 0)
  {
      perror("listen");
      exit(EXIT_FAILURE);
  }

  return domainSocket;
}

int
make_socket (uint16_t port, char* address)
{
  int sock;
  struct sockaddr_in name;
  int reuseaddr=1;
  socklen_t reuseaddr_len;

  /* Create the socket. */
  sock = socket (PF_INET, SOCK_STREAM, 0);
  if (sock < 0) {
    perror ("socket");
    exit (EXIT_FAILURE);
  }

  /* set option */
  reuseaddr_len=sizeof(reuseaddr);
  setsockopt(sock, SOL_SOCKET, SO_REUSEADDR, &reuseaddr, reuseaddr_len);

  /* Give the socket a name. */
  name.sin_family = AF_INET;
  name.sin_port = htons (port);
  name.sin_addr.s_addr = inet_addr(address);
  if (bind (sock, (struct sockaddr *) &name, sizeof (name)) < 0) {
    perror ("bind");
    exit (EXIT_FAILURE);
  }

  return sock;
}

void updateMac(int fd) {
  int len;
  char client_ip[MAXIP]= {0};
  socklen_t addr_size=sizeof(struct sockaddr_in);
  struct sockaddr_in addr;
  int res=getpeername(fd, (struct sockaddr*)&addr, &addr_size);

  strcpy(client_ip, inet_ntoa(addr.sin_addr));
  char cmd[128]= {0};
  memset(cmd, 0x0, sizeof(cmd));
  snprintf(cmd, sizeof(cmd)-1, "arp -a -n %s | awk '{printf $4}'", client_ip);

  client_struct *s=NULL, *tmp = NULL;

  HASH_FIND_STR( client_list, client_ip, s); 
  if (!s) {
    if (do_sys_command(cmd)) {
      if (strlen(mac)==17) {
        //add to hash table
        s = (client_struct*)malloc(sizeof(client_struct));
        strncpy(s->ip, client_ip, MAXIP);
        strncpy(s->mac, mac, MAXMAC);
        s->ts=time(NULL);
        HASH_ADD_STR( client_list, ip, s );
      }   
    }   
  } else {
    //check timestamp
    time_t now=time(NULL);
    if ((now - s->ts) > 600) {
      if (do_sys_command(cmd)) {
        if (strlen(mac)==17) {
          strncpy(s->mac, mac, MAXMAC);
          s->ts=now;
        }   
      }   
    }   
    strncpy(mac, s->mac, MAXMAC);
  }
}

int read_from_client (int filedes, char* buffer, int msgsize)
{
  int nbytes;

  nbytes = read (filedes, buffer, msgsize);
  if (nbytes < 0) {
    /* Read error. */
    perror ("read");
    exit (EXIT_FAILURE);
  } else if (nbytes == 0) {
    /* End-of-file. */
    return -1;
  } else {
    /* Data read. */
    return nbytes;
  }
}

/* Signal Handler for SIGINT */
void sigintHandler(int sig_num) 
{ 
    /* Reset handler to catch SIGINT next time. 
       Refer http://en.cppreference.com/w/c/program/signal */
    signal(SIGINT, sigintHandler); 
    log_printf("Cannot be terminated using Ctrl+C \n"); 
    fflush(stdout); 
} 

int main (int argc, char **argv)
{
  int sock;
  fd_set active_readfd_set;
  fd_set active_writefd_set;
  int i;
  size_t size;
  int opt;
  threadpool_t *pool=NULL;
  assert((pool = threadpool_create(THREAD, QUEUE, 0)) != NULL);

  //signal(SIGINT, sigintHandler); 

  while( (opt = getopt(argc, argv, "a:p:n:N:r:")) > 0) {
    switch (opt) {
    case 'p':
      port = atoi(optarg);
      sprintf(local_req, "127.0.0.1:%d", port);
      break;
    case 'n':
      node_mac=optarg;
      break;
    case 'r':
      server_url=optarg;
      break;
    case 'a':
      address=optarg;
      break;
    case 'N':
      node_id=optarg;
      break;
    default:
      log_printf("Invalid option\n\r");
      exit(1);
      break;
    }
  }


  /* Create the socket and set it up to accept connections. */
  sock = make_socket (port, address);
  if (listen (sock, 64) < 0) {
    perror ("listen");
    exit (EXIT_FAILURE);
  }
  if (sock > max_fd) {
    max_fd=sock;
  }

  int domainSocket=createDomainSocket();
  if (sock > max_fd) {
    max_fd=sock;
  }


  /* Initialize the set of active sockets. */
  FD_ZERO (&active_readfd_set);
  FD_SET (sock, &active_readfd_set);
  FD_SET (domainSocket, &active_readfd_set);

  FD_ZERO (&active_writefd_set);
  //FD_SET (sock, &active_writefd_set);

  //curl_global_init(CURL_GLOBAL_DEFAULT);

  while (1) {
    struct timeval tv;
    fd_set readfd_set;
    fd_set writefd_set;
    int ret;

    tv.tv_sec = 5;
    tv.tv_usec = 0;

    FD_ZERO (&readfd_set);
    FD_ZERO (&writefd_set);
    readfd_set = active_readfd_set;
    writefd_set = active_writefd_set;

    ret=select (max_fd+1, &readfd_set, &writefd_set, NULL, &tv);
    if (ret==-1) {
      log_printf("select error, exit\n");
      exit (EXIT_FAILURE);
    }
    else if (ret==0) {
      log_printf("select continue\n");
      continue;
    }
    else {
      /* Service all the sockets with input pending. */
      for (i = 0; i < (max_fd+1); ++i) {
        if (FD_ISSET (i, &readfd_set)) {
          if (i == sock) {
            /* Connection request on original socket. */
            struct sockaddr_in clientname;
            int new;

            size = sizeof (clientname);
            new = accept (sock, (struct sockaddr *) &clientname, &size);
            if (new < 0) {
              log_printf("accept error\n");
              //exit (EXIT_FAILURE);
            }
            client_id[new]=client_counter++;
            FD_SET (new, &active_readfd_set);

            if (new > max_fd) {
              max_fd=new;
            }
          } else if (i == domainSocket){
            log_printf("domain socket listen\n");
            struct sockaddr_in udsaddress;
            size_t addrlen = sizeof(udsaddress);
            int domainSocketNew = accept (domainSocket, (struct sockaddr *) &udsaddress, &addrlen);
            socket_type[domainSocketNew]=1;
            client_id[domainSocketNew]=client_counter++;
            FD_SET (domainSocketNew, &active_readfd_set);
            if (domainSocketNew > max_fd) {
              max_fd=domainSocketNew;
            }
          } else if (socket_type[i] == 1){
            log_printf("domain socket connection socket\n");
            char msg[1024]={0};
            int read_size=0;
            threadData resp;
            memset(&resp, 0x0, sizeof(resp));

             //clear domain socket

            //TODO: while?
            if ((read_size=recv(i, msg, sizeof(msg), 0))>0 ) {
              resp=*((threadData*)((msg+sizeof(int))));

              log_printf("uds mac:%s\n", resp.mac);
              log_printf("uds fd:%d\n", resp.fd);
              log_printf("uds authStatus:%d\n", resp.authStatus);
              log_printf("uds redir:%s\n", resp.redirect_url);
              log_printf("uds expire time:%llu\n", (long long)resp.expire);
              
              add_mac_cache(mac, resp.expire);
              //print_mac_cache();
            }

            else {
              log_printf("unable to recv data from uds\n");
              exit(1);
            }
            if (resp.client_id==client_id[resp.fd]) {
              FD_SET(resp.fd, &active_writefd_set);
            }
            close(i);
            FD_CLR (i, &active_readfd_set);
            socket_type[i]=0;
            client_id[i]=0;

          } else {
            log_printf("http read data\n");
            char buffer[MAXMSG]= {0};
            int read_size=read(i, buffer, MAXMSG);


            /* Data arriving on an already-connected socket. */
            if (read_size < 0) { //test case hit
              log_printf("read size < 0:%d\n", read_size);
              log_printf("close error with msg is: %s\n",strerror(errno));
     
              if (EAGAIN==errno || EWOULDBLOCK==errno || EINTR==errno || ECONNRESET==errno  || ETIMEDOUT==errno ) {
                FD_CLR (i, &active_readfd_set);
                FD_CLR (i, &active_writefd_set);
                close (i);
                socket_type[i]=0;
                client_id[i]=0;
              }
              else {
                exit(1);
              }
             }
            else if (read_size==0) {
              log_printf("read size == 0\n");
              FD_CLR (i, &active_readfd_set);
              FD_CLR (i, &active_writefd_set);
              close (i);
              socket_type[i]=0;
              client_id[i]=0;
            }
            else {
              int httpRet=http_header_parse(i, buffer, read_size);
              int ret=0;

              if (httpRet<0) {
                FD_CLR (i, &active_readfd_set);
                FD_CLR (i, &active_writefd_set);
                close(i);
                socket_type[i]=0;
                client_id[i]=0;
              } else {
                updateMac(i);
                snprintf(tData[i].mac, sizeof(tData[i].mac), "%s", mac);
                tData[i].client_id=client_id[i];
                tData[i].fd=i;
                //if (is_mac_hit(mac)) {
                if (0) {
                  log_printf("hit mac cache, response directly\n");
                  http_redir_response(i);
                  FD_CLR (i, &active_readfd_set);
                  FD_CLR (i, &active_writefd_set);
                  close(i);
                  socket_type[i]=0;
                  client_id[i]=0;
                }
                else {
                  make_redir_response(i);
                  //pthread_create(&threadId[i], NULL, curl_entry, &tData[i]);
                  ret=threadpool_add(pool, &curl_entry, (void*)&tData[i], 0);
                  if (ret!=0) {
                    if (ret==threadpool_queue_full) {
                      log_printf("thread pool queue is full\n");
                    }
                    FD_CLR (i, &active_readfd_set);
                    FD_CLR (i, &active_writefd_set);
                    close(i);
                    socket_type[i]=0;
                    client_id[i]=0;
                  }
                }
              }
            }
          }
        }//read fd set

        //log_printf("before check write select");
        if (FD_ISSET (i, &writefd_set)) {
          char buffer[MAXMSG]={0};
          int len = snprintf(buffer, sizeof(buffer),
                     "HTTP/1.1 200 OK\r\n"
                     "Connection: close\r\n"
                     "Content-Type: text/html\r\n"
                     "Pragma: no-cache\r\n"
                     "Expires: -1\r\n\r\n"
                     "<script>window.location.href=%s</script>", tData[i].redirect_url);
          send(i, buffer, len, MSG_NOSIGNAL); //disable sigpipe signal when remote socket is closed

          FD_CLR (i, &active_readfd_set);
          FD_CLR (i, &active_writefd_set);
          close(i);
          socket_type[i]=0;
          client_id[i]=0;
        }//write fd set
      }//for loop
    }//select 
  }//while

  assert(threadpool_destroy(pool, 0) == 0);
  //curl_global_cleanup();
}
