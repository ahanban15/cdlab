%{
   #include <stdlib.h>
   void yyerror(char*);
   #include "y.tab.h"
%}


%%

[01]            {
                    yylval = atoi(yytext);
                    return BOOLEAN; 
                }

x[1-9][0-9]?    { 
                    yylval = atoi(yytext+1)-1;
                    return VARIABLE; 
                }
      
[+.!()=\n]      { return *yytext; }
                
"=>"            { return IMPL; }

[ \t]           ;

%%

int yywrap(){
   return 1;
}
