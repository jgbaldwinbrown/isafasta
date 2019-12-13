%{
# define YYSTYPE long long
# include "isabed.tab.h"
%}

%%

"\n" {
    return CR;
}

"\t" {
    return TAB;
}

[0-9]+ {
    sscanf(yytext, "%lld", &yylval);
    return NUMBER;
}

[^\n\t0-9] {
    return OTHER;
}

%%

int yywrap(void) {
    return(1);
}
