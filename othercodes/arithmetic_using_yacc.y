
%{
#include<stdio.h>
#include<stdlib.h>
%}

%token NUMBER ID

%left '+' '-' 
%left '*' '/'
%%

expr: expr '+' expr
|expr '-' expr
|expr '*' expr
|expr '/' expr
|'-'NUMBER
|'-'ID
|'('expr')'
|NUMBER
|ID
;
%%

int main()
{
printf("Enter the arithmetic expression: \n");
yyparse();
printf("\nThe given arithmetic expression is VALID\n");
exit(0);
}

int yywrap(){}
int yyerror(char *s)
{
printf("\nThe given arithmetic expression is INVALID\n");
exit(0);
}

/*
anushka@anushka-hp:~$ yacc -d arithUsingYacc.y
anushka@anushka-hp:~$ flex arithUsingYacc.l
anushka@anushka-hp:~$ gcc lex.yy.c y.tab.c -o arith -ll
y.tab.c: In function ‘yyparse’:
y.tab.c:1028:16: warning: implicit declaration of function ‘yylex’ [-Wimplicit-function-declaration]
 1028 |       yychar = yylex ();
      |                ^~~~~
y.tab.c:1163:7: warning: implicit declaration of function ‘yyerror’; did you mean ‘yyerrok’? [-Wimplicit-function-declaration]
 1163 |       yyerror (YY_("syntax error"));
      |       ^~~~~~~
      |       yyerrok
anushka@anushka-hp:~$ ./arith
Enter the arithmetic expression: 
9+2

The given arithmetic expression is VALID
anushka@anushka-hp:~$ 
*/
