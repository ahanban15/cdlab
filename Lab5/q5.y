// Name: AHAN BANDYOPADHYAY
// Roll No.: 211210008
// CSB353 Compiler Design Lab5
//http://portcse.blogspot.com/2017/11/yacc-program-to-check-whether.html

/* Q. Write a Yacc program to check if the entered statement is a valid arithmetic expression.*/ 

//declaration section

%{
#include<stdio.h>
#include<stdlib.h>
%}


// Definition section

// token from lex file
%token NUMBER ID                       

// LL(1) grammar
%left '+' '-'                                           // left associative 
%left '*' '/'
%%

// grammer production rule 
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


//main function
int main()
{
	printf("Enter the arithmetic expression: \n");
	
	yyparse();
	
	printf("\nThe given arithmetic expression is VALID\n");
	exit(0);
}


//if error occured 
int yywrap(){}
int yyerror(char *s)
{
	printf("\nThe given arithmetic expression is INVALID\n");
	
	exit(0);
}


