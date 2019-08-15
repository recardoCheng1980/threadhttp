#ifndef _common_h
#define _common_h

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <sys/types.h>
#include <sys/socket.h>
#include <netinet/in.h>
#include <netinet/tcp.h>
#include <netdb.h>
#include <fcntl.h>
#include <signal.h>
#include <unistd.h>
#include <string.h>

#include <openssl/ssl.h>

#define HOST	"localhost"
#define RANDOM  "random.pem"
#define PORT	4433
#define BUFSIZZ 1024

#define KEYFILE "server.pem"
#define PASSWORD "password"
#define DHFILE "dh1024.pem"

extern BIO *bio_err;
int berr_exit (char *string);
int err_exit(char *string);
SSL_CTX *initialize_ctx();
void destroy_ctx(SSL_CTX *ctx);
void load_dh_params(SSL_CTX *ctx,char *file);
void generate_eph_rsa_key(SSL_CTX *ctx);

#if (OPENSSL_VERSION_NUMBER < 0x00905100L)
  #error "Must use OpenSSL 0.9.6 or later"
#endif

#endif
