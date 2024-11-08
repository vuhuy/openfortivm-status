VERSION		:= 0.0.1

PREFIX		?=

FULL_VERSION	:= $(VERSION)


DESC="Openfortivm status server"
WWW="https://github.com/vuhuy/openfortivm-status"


.PHONY:	all apk clean install uninstall
all:	build

apk:	$(APKF)

build:
	mkdir -p build
	/usr/local/go/bin/go build -o build/openfortivm-status cmd/status/main.go

install: build
	install -m 755 -d $(DESTDIR)/$(PREFIX)/bin
	install -m 755 build/openfortivm-status $(DESTDIR)/$(PREFIX)/bin
	install -m 755 -d $(DESTDIR)/$(PREFIX)/etc/init.d
	install -m 755 init/openfortivm-status $(DESTDIR)/$(PREFIX)/etc/init.d

clean:
	rm -rf build

uninstall:
	rm -f $(DESTDIR)/$(PREFIX)/bin/openfortivm-status
	rm -f $(DESTDIR)/$(PREFIX)/etc/init.d/openfortivm-status
