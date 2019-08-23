LDFLAGS +=
CFLAGS += -Wall --std=gnu99

OBJ := common.o simplehttpd.o http_parser.o threadpool.o curlthread.o
LIB := -Wl,--export-dynamic -L/lib/i386-linux-gnu/ -L/home/ubuntu/R1S-MT7621/user/uhttpd/mips/lib/ -ldl -lcurl -lpthread -lssl -lcrypto -lz
INCLUDE := -I./mips/include/

%.o: %.c
	cp ~/R1S-MT7621/extralib/libcrypto.so.1.0.0 ~/R1S-MT7621/lib/lib/libcrypto.so
	cp ~/R1S-MT7621/extralib/libssl.so.1.0.0 ~/R1S-MT7621/lib/lib/libssl.so
	$(CC) $(CFLAGS) $(INCLUDE) -c -o $@ $<

all: $(OBJ)
	cp ~/R1S-MT7621/extralib/libcrypto.so.1.0.0 ~/R1S-MT7621/lib/lib/libcrypto.so
	cp ~/R1S-MT7621/extralib/libssl.so.1.0.0 ~/R1S-MT7621/lib/lib/libssl.so
	$(CC) -o uhttpd $(LDFLAGS) $(LIB) $(OBJ)

clean:
	rm -f *.o *.so uhttpd

romfs:
	@echo "uhttpd romfs"
