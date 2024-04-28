%{
#include "y.tab.h"
%}

%%
[a-zA-Z_][a-zA-Z0-9_]*  { return IDENTIFIER; }
[&|()!]+                { return yytext[0]; }
"=="                     { return EQ; }
"!="                     { return NE; }
\n                       { return '\n'; }
[ \t]                    ; /* ignore whitespace */
.                        { yyerror("Invalid character"); }

%%

int yywrap() {
    return 1;
}

