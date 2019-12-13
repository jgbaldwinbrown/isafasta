all: isafasta isafastq isabed

clean:
	rm -r isafasta.tab.c isafasta isafastq isabed

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
