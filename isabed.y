%{
#include <stdio.h>
#include <stdlib.h>
#include <ctype.h>

int yylex();
int yyerror( char* message);
%}
%error-verbose
%token DIGIT TAB CR OTHER
%start input
%%

input:   input entry | entry;
entry: chrom TAB start TAB end rest;
anylist: anylist any | any;
any: DIGIT | OTHER;
anytablist: anytablist anytab | anytab;
anytab: any | TAB;
chrom: anylist ;
start: pos;
end: pos;
pos: digitlist ;
digitlist: digitlist DIGIT | DIGIT;
rest: TAB anytablist CR | CR;

%%
int yyerror( char* message)
    {
    fprintf(stderr,"NOT A BED %s\n",message);
    exit(EXIT_FAILURE);
    return -1;
    }
int yylex()
    {
    int c=fgetc(stdin);
    switch(c)
        {
        case EOF: return c;
        case '\t' : return TAB;
        case '\n' : return CR;
        default:
            if (isdigit(c)) {
                return DIGIT;
            } else {
                return OTHER;
            }
        }
    }

int main(int argc, char** argv)
    {
    return yyparse();
    }
