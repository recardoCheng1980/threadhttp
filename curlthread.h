#ifndef _curlthread_h
#define _curlthread_h

#include <curl/curl.h>
#include <pthread.h>

#ifdef __cplusplus
extern "C" {
#endif

typedef struct threadData {
  int fd;
  int authStatus;
  unsigned int client_id;
  char mac[20];
} threadData;

typedef struct curlString {
  char* ptr;
  size_t len;
} curlString;


void init_string(curlString *s);
size_t callbackFunc(void *ptr, size_t size, size_t nmemb, curlString *s);
void* curl_entry(void* param);

#ifdef __cplusplus
}
#endif
#endif
