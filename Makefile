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

isabed.tab.c: isabed.y
	bison isabed.y
isabed: isabed.tab.c
	gcc -Wall -O3 -o $@ $^
