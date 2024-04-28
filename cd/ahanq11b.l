%{
#include "y.tab.h"
%}

%%
[0-9]+          { yylval = atoi(yytext); return NUMBER; }
[ \t\n]         ; // Ignore whitespace and newlines
[-+*/()]        { return *yytext; } // Return the operator or parenthesis
.               { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}

