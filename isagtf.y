%{
#define YYSTYPE long long
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int yylex();
int yylineno;
int yyerror( char* message);
%}
%error-verbose
%token FLOAT INT TAB SPACE SEMI SIGN QUOTE CR GENE_ID TRANSCRIPT_ID OTHER DOT
%start input
%%

input:   input entry | entry  ;
entry: seqname TAB source TAB feature TAB start TAB end TAB score TAB strand TAB frame TAB attributes CR ;
seqname: anylist  ;
source: anylist  ;
feature: anylist  ;
start: INT   | DOT ;
end: INT   | DOT ;
score: number  | DOT ;
strand: SIGN  | DOT ;
frame: INT  | DOT ;
attributes: gene_id transcript_id  | DOT ;
gene_id: spaces_opt GENE_ID spaces_opt QUOTE anylist QUOTE spaces_opt SEMI ;
transcript_id: spaces_opt TRANSCRIPT_ID spaces_opt QUOTE anylist QUOTE spaces_opt SEMI ;
spaces: spaces SPACE | SPACE ;
spaces_opt: spaces | ;
anylist: anylist any | any  ;
any: number | OTHER | SEMI | SIGN | GENE_ID | TRANSCRIPT_ID | DOT ;
number: FLOAT | INT ;

%%
int yyerror( char* message)
    {
    fprintf(stderr,"NOT A BED: %s\n",message);
    fprintf(stderr, "Line %d\n", yylineno);
    exit(EXIT_FAILURE);
    return -1;
    }

int main(int argc, char** argv)
    {
    return yyparse();
    }
