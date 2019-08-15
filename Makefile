all: uhttpd

clean:
	-rm ./*.o uhttpd

uhttpd: common.c http_parser.c simplehttpd.c curlthread.c
	$(CC) -o uhttpd common.c http_parser.c simplehttpd.c curlthread.c -lcurl -lpthread
