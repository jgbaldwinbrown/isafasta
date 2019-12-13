%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int yylex();
int yyerror( char* message);

int yylineno = 1;

%}
%error-verbose
%token LT OTHER SYMBOL CR
%start input
%%

input:   input  sequence | optspaces sequence;
sequence: head body optspaces;
head: LT anylist CR | LT CR;
anylist: anylist any | any;
any: LT | OTHER | SYMBOL;
body: symbols CR | body symbols CR ;
symbols: symbols symbol | symbol ;
symbol: SYMBOL;
optspaces: | crlist;
crlist: crlist CR | CR;

%%
int yyerror( char* message)
    {
    fprintf(stderr,"NOT A FASTA: %s\n",message);
    fprintf(stderr, "Line %d\n", yylineno);
    exit(EXIT_FAILURE);
    return -1;
    }
int yylex()
    {
    int c=fgetc(stdin);
    switch(c)
        {
        case EOF: return c;
        case '>' : return LT;
        case '\n' : 
            yylineno++;
            return CR;
        default: return isalpha(c)?SYMBOL:OTHER;
        }
    }

int main(int argc, char** argv)
    {
    return yyparse();
    }
