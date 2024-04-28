%{
#include "y.tab.h"
extern int yylval; 
%}


NUM [0-9]+

%%

"+" { return PLUS; }
"*" { return MULTIPLY; }
"(" { return LPAREN; }
")" { return RPAREN; }
{NUM} { yylval = atoi(yytext); return NUMBER; }
\n { return 0; } // Return 0 to indicate end of input

. { /* Ignore any other characters */ }

%%

int yywrap() {
    return 1; // Indicate end of input
}

