all: isafasta

clean:
	rm -r isafasta.tab.c isafasta

isafasta.tab.c: isafasta.y
	bison isafasta.y
isafasta: isafasta.tab.c
	gcc -Wall -O3 -o $@ $^
