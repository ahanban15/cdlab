%{
#include "y.tab.h"
#include<stdio.h>
#include <stdlib.h>
%}

%%
"int" {return KEY;}
"float" {return KEY;}
"char" {return KEY;}
"double" {return KEY;}
[a-zA-Z][a-zA-Z0-9]* {return ID;}
[0-9]+ {return NUM;}
[\t] ;
[;] {return COLON;}
\n {return 0;}
. {return yytext[0];}
%%

int yywrap(){
   return 1;
}
