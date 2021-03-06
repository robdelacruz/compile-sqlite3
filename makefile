VER=3280000
SRCNAME=sqlite-amalgamation-$(VER)
SRCFILE=$(SRCNAME).zip
SRCZIP_URL=https://www.sqlite.org/2019/$(SRCFILE)

CFLAGS=-DSQLITE_ENABLE_FTS5 -DHAVE_READLINE

all: sqlite3

sqlite3: sqlite3.c sqlite3.h shell.c sqlite3ext.h
	gcc $(CFLAGS) shell.c sqlite3.c -lpthread -ldl -lm -lreadline -lncurses -o sqlite3

sqlite3.c:
	wget $(SRCZIP_URL)
	unzip $(SRCFILE)
	mv $(SRCNAME)/* .

install: sqlite3
	sudo cp sqlite3 /usr/bin

clean:
	rm -rf *.zip $(SRCNAME) *.c *.h sqlite3


