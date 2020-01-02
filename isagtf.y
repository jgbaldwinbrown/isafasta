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
%token FLOAT INT TAB SPACE SEMI SIGN QUOTE CR GENE_ID TRANSCRIPT_ID OTHER
%start input
%%

input:   input entry | entry  ;
entry: seqname TAB source TAB feature TAB start TAB end TAB score TAB strand TAB frame TAB attributes CR ;
seqname: anylist ;
source: anylist ;
feature: anylist ;
start: INT  ;
end: INT  ;
score: number ;
strand: SIGN ;
frame: INT ;
attributes: gene_id transcript_id ;
gene_id: spaces_opt GENE_ID spaces_opt QUOTE anylist QUOTE spaces_opt SEMI ;
transcript_id: spaces_opt TRANSCRIPT_ID spaces_opt QUOTE anylist QUOTE spaces_opt SEMI ;
spaces: spaces SPACE | SPACE ;
spaces_opt: spaces | ;
anylist: anylist any | any  ;
any: number | OTHER | SEMI | SIGN | GENE_ID | TRANSCRIPT_ID ;
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
