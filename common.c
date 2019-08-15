#include "common.h"
#include <arpa/inet.h>    //close                                               
#include <sys/types.h>                                                          
#include <sys/socket.h>                                                         
#include <sys/select.h>                                                         
#include <netinet/in.h>  

#define true 1                                                                  
#define false 0     

int setFdNoNagle(int fd, int isUdp) {                                      
  if (isUdp)                                                                       
    return true;                                                                   
  int32_t one = 1;                                                                 
  if (setsockopt(fd, IPPROTO_TCP, TCP_NODELAY, (char *) & one, sizeof (one)) != 0) {
    return false;                                                                  
  }                                                                                
  return true;                                                                     
}                                                                                  
                                                                                   
int setFdReuseAddress(int fd) {                                                
  int32_t one = 1;                                                                 
  if (setsockopt(fd, SOL_SOCKET, SO_REUSEADDR, (char *) & one, sizeof (one)) != 0) {
    printf("Unable to reuse address");                                             
    return false;                                                                  
  }                                                                                
  return true;                                                                  
}                                                                               

int setFdKeepAlive(int fd, int isUdp) {                                    
  if (isUdp)                                                                    
    return true;                                                                
                                                                                
  int32_t one = 1;                                                              
  int32_t keepidle = 10;                                                        
  int32_t keepintvl = 5;                                                        
  int32_t keepcnt = 3;                                                          
                                                                                
  if (setsockopt(fd, SOL_SOCKET, SO_KEEPALIVE,                                  
      (const char*) & one, sizeof (one)) != 0) {                                
    printf("Unable to set SO_NOSIGPIPE");                                       
    return false;                                                               
  }                                                                             
                                                                                
  if (setsockopt(fd, SOL_TCP, TCP_KEEPIDLE,                                     
      (const char*) &keepidle, sizeof (keepidle)) != 0) {                       
    printf("Unable to set TCP_KEEPIDLE");                                       
  }                                                                             
  if (setsockopt(fd, SOL_TCP, TCP_KEEPINTVL,                                    
      (const char*) &keepintvl, sizeof (keepintvl)) != 0) {                     
    printf("Unable to set TCP_KEEPINTVL");                                      
  }                                                                             
  if (setsockopt(fd, SOL_TCP, TCP_KEEPCNT,                                      
      (const char*) &keepcnt, sizeof (keepcnt)) != 0) {                         
    printf("Unable to set TCP_KEEPCNT");                                        
  }                                                                             
                                                                                
  return true;                                                                  
}  

int setFdNonBlock(int fd) {                                                 
  int32_t arg;                                                                  
  if ((arg = fcntl(fd, F_GETFL, NULL)) < 0) {                                   
    int32_t err = errno;                                                        
    printf("Unable to get fd flags: %d,%s", err, strerror(err));                
    return false;                                                               
  }                                                                             
  arg |= O_NONBLOCK;                                                            
  if (fcntl(fd, F_SETFL, arg) < 0) {                                            
    int32_t err = errno;                                                        
    printf("Unable to set fd flags: %d,%s", err, strerror(err));                
    return false;                                                               
  }                                                                             
                                                                                
  return true;                                                                  
} 

int setFdOptions(int fd) {                                                     
  if (!setFdNonBlock(fd)) {                                                        
    printf("Unable to set non block");                                             
    return false;                                                                  
  }                                                                                
                                                                                   
  if (!setFdKeepAlive(fd, false)) {                                                
    printf("Unable to set keep alive");                                            
    return false;                                                                  
  }                                                                                
                                                                                   
  if (!setFdNoNagle(fd, false)) {                                                  
    printf("Unable to disable Nagle algorithm");                                   
  }                                                                                
                                                                                   
  if (!setFdReuseAddress(fd)) {                                                    
    printf("Unable to enable reuse address");                                      
    return false;                                                                  
  }                                                                                
  return true;                                                                     
}   
