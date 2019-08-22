#ifndef _curlthread_h
#define _curlthread_h

#include <pthread.h>
#include "curl/curl.h"

#define MAXMSG  1024
#define MAXURLMSG 512
#define MAXIP 20
#define MAXMAC 20

#ifdef __cplusplus
extern "C" {
#endif

typedef struct threadData {
  int fd;
  int authStatus;
  unsigned int client_id;
  char mac[20];
  char redirect_url[MAXURLMSG];
  time_t expire;
} threadData;

typedef struct curlString {
  char* ptr;
  size_t len;
} curlString;


int cli_conn(threadData* pData);
void init_string(curlString *s);
size_t writefunc(void *ptr, size_t size, size_t nmemb, curlString *s);
void* curl_entry(void* param);

#ifdef __cplusplus
}
#endif
#endif
