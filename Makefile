all: isafasta isafastq isabed isagtf

clean:
	rm -r isafasta.tab.c isafasta isafastq isabed isagtf isagtf.tab.c isagtf.tab.h

test:
	sh test.sh

.DELETE_ON_ERROR:

.PHONY: all clean

isafasta.tab.c: isafasta.y
	bison isafasta.y
isafasta: isafasta.tab.c
	gcc -Wall -O3 -o $@ $^

isafastq.tab.c: isafastq.y
	bison isafastq.y
isafastq: isafastq.tab.c
	gcc -Wall -O3 -o $@ $^

isabed.yy.c: isabed.l isabed.tab.h
	flex -o $@ $<
isabed.yy.o: isabed.yy.c
	gcc -c -Wall -O3 $< -o $@
isabed.tab.c isabed.tab.h: isabed.y
	bison -d isabed.y
isabed.tab.o: isabed.tab.c
	gcc -c -Wall -O3 -o $@ $^
isabed: isabed.tab.o isabed.yy.o
	gcc -Wall -O3 -o $@ $^

isagtf.yy.c: isagtf.l isagtf.tab.h
	flex -o $@ $<
isagtf.yy.o: isagtf.yy.c
	gcc -c -Wall -O3 $< -o $@
isagtf.tab.c isagtf.tab.h: isagtf.y
	bison -d isagtf.y
isagtf.tab.o: isagtf.tab.c
	gcc -c -Wall -O3 -o $@ $^
isagtf: isagtf.tab.o isagtf.yy.o
	gcc -Wall -O3 -o $@ $^
