# isafasta

## Introduction

This is a copy of a wonderful FASTA parser from the following BioStars thread:

[https://www.biostars.org/p/42126/](https://www.biostars.org/p/42126/)

The initial version of this code was generously made available by Pierre
Lindenbaum under the MIT license v. 2. It is now licensed under the AGPL.

## Installation

This program can be built with the following command:

```sh
make
```

and then should be copied into a directory that is in your `PATH` for use.

### Usage

To check if a file is in valid FASTA format, provide the file to standard
input of this program as follows:

```sh
isafasta <infile.fa
```

If no output is returned, the file is a valid FASTA file. If the file
is not a valid FASTA, an error message will be reported.
To check if a file is in valid FASTA format, provide the file to standard
input of this program as follows:
