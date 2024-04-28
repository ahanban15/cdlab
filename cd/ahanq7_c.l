%{ 
/* Definition section */
#include<stdio.h> 
#include<stdlib.h> 
#include"y.tab.h" 
extern int yylval; 
%} 

/* Rule Section */
%% 
[0-9]+ { yylval = atoi(yytext); return INTEGER; }
\.     { return DOT; }

[ \t]  { ; } 
\n     { return 0; } 
.      { return yytext[0]; } 
%% 

int yywrap() 
{ 
    return 1; 
}

