all: uhttpd

clean:
	rm ./*.o uhttpd

uhttpd: common.c http_parser.c simplehttpd.c curlthread.c threadpool.c
	$(CC) -o uhttpd common.c http_parser.c simplehttpd.c curlthread.c threadpool.c -I./ubuntu/curl/include/ -L./ubuntu/curl/lib/ -lcurl -lpthread
