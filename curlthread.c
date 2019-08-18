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
    
    pData->authStatus=pData->client_id;
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

void curl_entry(void* param)
{
  CURL *curl;
  CURLcode res;
  threadData pData={0};
  
  memcpy(&pData, param, sizeof(threadData));

  //printf("thread begin: %ld, %ld\n", (long)getpid(), (long)getppid());
  curl = curl_easy_init();
  if(curl) {
    curlString s;
    init_string(&s);

#if 1
    //curl_easy_setopt(curl, CURLOPT_URL, "http://35.229.214.234:8080/");
    curl_easy_setopt(curl, CURLOPT_URL, "http://example.com");
    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &s);
    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 1L);
    curl_easy_setopt(curl, CURLOPT_NOSIGNAL, (long)1);
    res = curl_easy_perform(curl);
#else

    curl_easy_setopt(curl, CURLOPT_URL, "https://35.229.214.234:1568/");
//    curl_easy_setopt(curl, CURLOPT_WRITEFUNCTION, writefunc);
//    curl_easy_setopt(curl, CURLOPT_WRITEDATA, &s);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYPEER, 0L);
    curl_easy_setopt(curl, CURLOPT_SSL_VERIFYHOST, 0L);
//    curl_easy_setopt(curl, CURLOPT_TIMEOUT, 1L);
//    curl_easy_setopt(curl, CURLOPT_NOSIGNAL, (long)1);
    res = curl_easy_perform(curl);
#endif



    if (res == CURLE_OK) {
      //printf("==============\n");
      //printf("%s\n", s.ptr);
      free(s.ptr);
      s.ptr=NULL;
    }   

    /* always cleanup */
    curl_easy_cleanup(curl);
  }   
  cli_conn(&pData); 
  //printf("thread end: %ld, %ld\n", (long)getpid(), (long)getppid());
}
