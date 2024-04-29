%{ 
/* Definition section */
#include<stdio.h> 
#include "y.tab.h" 
extern int yylval; 
extern int flag; 

void yyerror(char *s) {
    printf("\n%s\n\n", s);
    flag = 1;
}
%} 

/* Rule Section */
%% 
[0-9]+ { 
		yylval=atoi(yytext); 
		return NUMBER; 

	} 
[\t] ; 

[\n] return 0; 

. return yytext[0]; 

%% 


int yywrap() 
{ 
return 1; 
} 


anushka@anushka-hp:~$ lex calculator.l
anushka@anushka-hp:~$ yacc calculator.y
anushka@anushka-hp:~$ gcc lex.yy.c y.tab.c -o calculator -lfl -w
anushka@anushka-hp:~$ ./calculator

