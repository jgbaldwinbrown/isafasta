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
%token NUMBER TAB CR OTHER
%start input
%%

input:   input entry | entry  ;
entry: chrom TAB pos rest  ;
anylist: anylist any | any  ;
any: NUMBER | OTHER  ;
anytablist: anytablist anytab | anytab  ;
anytab: any | TAB  ;
chrom: anylist   ;
pos: start TAB end {
    if ($3 <= $1) {
        yyerror("End coordinate larger than start coordinate.");
    }
};
start: NUMBER  ;
end: NUMBER  ;
rest: TAB anytablist CR | CR  ;

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
