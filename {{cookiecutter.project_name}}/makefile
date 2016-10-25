
CC=go
PROJ={{cookiecutter.project_name}}
DEBUGFLAGS=-c -gcflags "-N -l"

build:
	$(CC) build -o $(PROJ).out .

debug:
	$(CC) test $(DEBUGFLAGS)

test:
	make debug && ./$(PROJ).test -test.v

bench:
	make debug && ./$(PROJ).test -test.bench .

benchalloc:
	make debug && GODEBUG=allocfreetrace=1 ./$(PROJ).test -test.run=None -test.bench . 2>trace.log

coverage:
	go test -coverprofile cover.out && go tool cover -html cover.out
