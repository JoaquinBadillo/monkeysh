DESTDIR :=
PREFIX := /usr/local

.PHONY: all
all:
	go build -o bin/monkeysh src/*.go

.PHONY: install
install:
	install -d $(DESTDIR)$(PREFIX)/bin
	install -m755 bin/monkeysh $(DESTDIR)$(PREFIX)/bin

.PHONY: man
man:
	pandoc -s -t man -o - man.md|gzip > monkeysh.1.gz
	install -d $(DESTDIR)$(PREFIX)/share/man/man1
	install -m644 monkeysh.1.gz $(DESTDIR)$(PREFIX)/share/man/man1
		
.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/monkeysh
	rm -f $(DESTDIR)$(PREFIX)/share/man/man1/monkeysh.1.gz

.PHONY: clean
clean:
	rm -f bin/monkeysh
	rm -f monkeysh.1.gz

.PHONY: rel
rel:
	GOOS=darwin GOARCH=amd64 go build -o bin/monkeysh-osx src/*.go
	GOOS=windows GOARCH=amd64 go build -o bin/monkeysh.exe src/*.go
	GOOS=linux GOARCH=amd64 go build -o bin/monkeysh-linux src/*.go
	GOOS=linux GOARCH=arm go build -o bin/monkeysh-linux_arm src/*.go
	GOOS=linux GOARCH=arm64 go build -o bin/monkeysh-linux_arm64 src/*.go
