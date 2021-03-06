# isafasta

## Introduction

`isafasta` is a set of tools that allow you to check the integrity of
file formats common in bioinformatics, including FASTA and FASTQ files.

This is a copy of a wonderful FASTA parser from the following BioStars thread:

[https://www.biostars.org/p/42126/](https://www.biostars.org/p/42126/)

The initial version of this code was generously made available by Pierre
Lindenbaum under the MIT license v. 2. It is now licensed under the AGPL.

## Installation

These programs can be built with the following command:

```sh
make
```

and then should be copied into a directory that is in your `PATH` for use.

## Usage

### isafasta

To check if a file is in valid FASTA format, provide the file to standard
input of this program as follows:

```sh
isafasta <infile.fa
```

If no output is returned, the file is a valid FASTA file. If the file
is not a valid FASTA, an error message will be reported.

### isafastq

To check if a file is in valid FASTQ format, provide the file to standard
input of this program as follows:

```sh
isafastq <infile.fq
```

If no output is returned, the file is a valid FASTQ file. If the file
is not a valid FASTQ, an error message will be reported.

### isabed

To check if a file is in valid bed format, provide the file to standard
input of this program as follows:

```sh
isabed <infile.bed
```

If no output is returned, the file is a valid bed file. If the file
is not a valid bed, an error message will be reported.
