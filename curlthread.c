#include <stdio.h>
#include <stdlib.h>
#include <sys/un.h>
#include "curlthread.h"

int cli_conn(threadData* pData)
{
    char path[] = "/tmp/uds";
    int clientSocket = socket(AF_UNIX, SOCK_STREAM, 0);
    if (clientSocket == -1) {
      printf("unable to create uds thread socket\n");
      exit(1);
    }
    struct sockaddr_un addr;
    addr.sun_family = AF_UNIX;
    strncpy(addr.sun_path, path, sizeof(addr.sun_path));

    if (connect(clientSocket, (struct sockaddr *)&addr, sizeof(addr)) == -1) {
      printf("unable to connect uds thread socket\n");
      exit(1);
    }
    
    int bufferSize=sizeof(threadData)+sizeof(int);
    char *buffer=malloc(bufferSize);
    
    memset(buffer, 0x0, bufferSize);
    int length=sizeof(threadData);
    *((int*)buffer)=length;
    *((threadData*)(buffer+4))=*pData;

    if(write(clientSocket, buffer, bufferSize)<0) {
      printf("unable to connect uds thread socket\n");
      exit(1);
    }

    close(clientSocket);
    free(buffer);
}

void init_string(curlString *s) {
  s->len = 0;
  s->ptr = (char*) malloc(s->len+1);
  if (s->ptr == NULL) {
    fprintf(stderr, "malloc() failed\n");
    exit(EXIT_FAILURE);
  }
  s->ptr[0] = '\0';
}

size_t writefunc(void *ptr, size_t size, size_t nmemb, curlString *s)
{
  size_t new_len = s->len + size*nmemb;
  s->ptr = (char*) realloc(s->ptr, new_len+1);

  if (s->ptr == NULL) {
    fprintf(stderr, "realloc() failed\n");
  }
  memcpy(s->ptr+s->len, ptr, size*nmemb);
  s->ptr[new_len] = '\0';
  s->len = new_len;
  //printf ("%s", s->ptr);
  //printf ("==============\n") ;

  return size*nmemb;
}

int execmd(char* result, int len, char* mac, char* redirect_url) {
  FILE *fp=NULL;
  char cmd[128]={0};
  char fileName[32]={0};
  char errFileName[32]={0};

/*
#$1 mac
#$2 result file name
#$3 error file name
#$4 redirect url
*/

  snprintf(fileName, sizeof(fileName), "/tmp/uhttpd_log/thread.%d", getpid());
  snprintf(errFileName, sizeof(errFileName), "/tmp/uhttpd_log/errthread.%d", getpid());
  snprintf(cmd, sizeof(cmd), "./curl.sh %s %s %s %s", mac, fileName, errFileName, redirect_url);
  printf("cmd:%s\n", cmd);
  int ret=system(cmd);
  if (ret!=0) {
    printf("unable to exec curl, ret status:%d\n", ret);
    return 1;
  }

  fp=fopen(fileName, "rb");
  if (fp) {
    while (!feof(fp)) {
      int readSize=fread(result, 1, len, fp);
      if (readSize<0) {
        printf("unable to read file:%s\n", fileName);
        fclose(fp);
        return 1;
      }
    }
    fclose(fp);
  }
  return 0;
}

void curl_entry(void* param)
{
  CURL *curl;
  CURLcode res;
  threadData pData={0};
  int ret;
  
  printf("beg thread: %ld, %ld\n", (long)getpid(), (long)getppid());
  memcpy(&pData, param, sizeof(threadData));

#if 1
  char result[64]={0};
  ret=execmd(result, sizeof(result), pData.mac, pData.redirect_url);
  if (ret==0) {
    char *pComma=strstr(result, ",");
    if (pComma!=NULL) {
      printf("%p, %p\n", result, pComma);
      *pComma='\0';
      int authStatus=atoi(result);
      int ts=atoi(pComma+1);
      printf("authStatus:%d, ts:%d\n", authStatus, ts);
      pData.authStatus=authStatus;
      pData.expire=ts;
    }
  }
  else {
      pData.authStatus=0;
      pData.expire=0;
  }
#else
  curl = curl_easy_init();
  if(curl) {
    curlString s;
    init_string(&s);

    curl_easy_setopt(curl, CURLOPT_URL, "http://macauth.chengshihayng.com/macauth");
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &s);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 5L);
    ret = curl_easy_perform(curl);

    if (ret != CURLE_OK) {
      printf("ret:%d, CURLE_OK:%d\n", ret, CURLE_OK);
    }   
    else {
      printf("%s\n", s.ptr);
      char *pComma=strstr(s.ptr, ",");

      if (pComma!=NULL) {
        printf("%p, %p\n", s.ptr, pComma);
        *pComma='\0';
        int authStatus=atoi(s.ptr);
        int ts=atoi(pComma+1);
        printf("authStatus:%d, ts:%d\n", authStatus, ts);
        pData.authStatus=authStatus;
        pData.expire=ts;
      }
 
      free(s.ptr);
      s.ptr=NULL;
    }   

    /* always cleanup */
    curl_easy_cleanup(curl);
  }  
#endif

    cli_conn(&pData); 

  printf("end thread: %ld, %ld\n", (long)getpid(), (long)getppid());

}
