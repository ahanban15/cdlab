%{
#include "y.tab.h"
%}

%%

[()]    { return yytext[0]; }
[a-zA-Z]    { yylval = yytext[0]; return 'a'; }
\n      { return '\n'; }
[ \t]   ;  /* skip whitespace */

.       { /* ignore anything else */ }

%%

int yywrap() {
    return 1;
}

