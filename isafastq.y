%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int yylex();
int yyerror( char* message);

int yylineno = 1;

%}
%error-verbose
%token LT OTHER SYMBOL CR PLUS QUALV
%start input
%%

input:   input fullentry | fullentry;
fullentry: sequence qualentry; 
sequence: head body;
qualentry: plusline qualbody;
head: LT anylist CR | LT CR;
body: symbols CR;
anylist: anylist any | any;
any: LT | OTHER | SYMBOL | QUALV | PLUS;
qualbody: quals CR;
quals: quals qual | qual;
qual: LT | SYMBOL | QUALV | PLUS;
symbols: symbols symbol | symbol;
symbol: SYMBOL;
plusline: PLUS anylist CR | PLUS CR;

%%
int yyerror( char* message)
    {
    fprintf(stderr,"NOT A FASTQ: %s\n",message);
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
        case '@' : return LT;
        case '+' : return PLUS;
        case '\n' : return CR;
        default:
            if (isalpha(c)) {
                return SYMBOL;
            } else if (c >= 33) {
                return QUALV;
            } else {
                return OTHER;
            }
        }
    }

int main(int argc, char** argv)
    {
    return yyparse();
    }
