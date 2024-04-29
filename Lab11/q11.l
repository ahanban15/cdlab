%{
#include "y.tab.h"
%}

%%

"(" { return '('; }
")" { return ')'; }
"+" { return PLUS; }
"*" { return TIMES; }
"max" { return MAX; }
"min" { return MIN; }
[0-9]+ {
    yylval = atoi(yytext);
    return NUMBER;
}
[ \t\n] ;  /* Ignore whitespace */

. { return yytext[0]; } 

%%

int yywrap() {
    return 1;
}

