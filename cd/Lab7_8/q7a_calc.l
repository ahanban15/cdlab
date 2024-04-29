%{
#include "y.tab.h"
%}

%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"(" { return LPAREN; }
")" { return RPAREN; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }
\n { return 0; }
[ \t] ; /* skip whitespace */
. { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}

