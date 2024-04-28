%{
#include <stdio.h>
int flag=0;
%}

%token ID KEY COLON COMMA NUM

%%
stmt: list{printf("\nDeclaration is valid\n");};
list : KEY list
     | list ',' list
     |list ',' ',' {printf("Syntax error : Consecutive commas used\n");exit(0);}
     | ID '[' NUM ']'
     | ID '[' NUM '.' ']' {printf("Float number cant be size of an array\n");exit(0);}
     | ID '[' ID ']' {printf("Size of an array should be integer\n");exit(0);}
     | ID '[' ID  {printf("Closing parenthesis is missing\n");exit(0);}
     | ID '['  {printf("size of array should be given\n");exit(0);}
     | ID
     ;
%%
main(){
   printf("Enter valid declaration :");
   yyparse();
}
yyerror() {printf("Invalid Statement\n");exit(1);}
