%{
# define YYSTYPE long long
# include "isagtf.tab.h"
%}
%option yylineno

%%

"\n" {
    return CR;
}

"\t" {
    return TAB;
}

[0-9]*\.[0-9]* {
    /* sscanf(yytext, "%lf", &yylval); */
    return FLOAT;
}

[0-9]+ {
    sscanf(yytext, "%lld", &yylval);
    return INT;
}

\. {
    return DOT;
}

\  {
    return SPACE;
}

;  {
    return SEMI;
}

\+|-  {
    return SIGN;
}

\" {
    return QUOTE;
}

"gene_id" {
    return GENE_ID;
}

"transcript_id" {
    return TRANSCRIPT_ID;
}

[^\n\t0-9 "] {
    return OTHER;
}

%%

int yywrap(void) {
    return(1);
}
