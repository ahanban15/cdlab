%{ 
/* Definition section */
#include<stdio.h> 
#include<stdlib.h> 
void yyerror(char *s); 
%} 
%token ZERO ONE 

/* Rule Section */
%% 
N: L {printf("\n%d", $$);} 
L: L B {$$=$1*2+$2;} 
| B {$$=$1;} 
B:ZERO {$$=$1;} 
|ONE {$$=$1;}; 
%% 

//driver code 
int main() 
{ 
while(yyparse()); 
} 

yyerror(char *s) 
{ 
fprintf(stdout, "\n%s", s); 
} 


/*
anushka@anushka-hp:~$ yacc -d bintodec.y
anushka@anushka-hp:~$ lex bintodec.l
anushka@anushka-hp:~$ gcc lex.yy.c y.tab.c -ll

anushka@anushka-hp:~$ ./a.out
1111

15
*/
