CRYSTAL_BIN ?= $(shell which crystal)
SHARDS_BIN ?= $(shell which shards)
GPM_BIN ?= $(shell which gpm)
PREFIX ?= /usr/local

build:
	$(CRYSTAL_BIN) build --release -o bin/gpm src/gpm/main.cr $(CRFLAGS)

clean:
	rm -f ./bin/ezdb

test:
	$(CRYSTAL_BIN) spec --verbose

spec: test

deps:
	$(SHARDS_BIN)

install: deps build
	mkdir -p $(PREFIX)/bin
	cp ./bin/gpm $(PREFIX)/bin

reinstall: build
	cp -rf ./bin/gpm $(GPM_BIN)
