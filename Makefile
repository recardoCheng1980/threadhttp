all: uhttpd

clean:
	rm ./*.o uhttpd

uhttpd: common.c http_parser.c simplehttpd.c curlthread.c
	$(CC) -o uhttpd threadpool.c common.c http_parser.c simplehttpd.c curlthread.c -I./ubuntu/curl/include/ -L./ubuntu/curl/lib/ -lcurl -lpthread
