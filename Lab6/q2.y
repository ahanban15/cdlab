%{
#include <stdio.h>
#include <stdlib.h>
int flag = 0;
%}

%token ID KEY COLON COMMA NUM

%%
stmt: list{printf("\nThe input Declarative statement is valid\n");};
list : KEY list
     | list ',' list
     | list ',' ',' {printf("Consecutive commas invalid.\n");exit(0);}
     | ID '[' NUM ']'
     | ID '[' NUM '.' ']' {printf("Float number canNOT be the size of an array.\n");exit(0);}
     | ID '[' ID ']' {printf("Size should be integer.\n");exit(0);}
     | ID '[' ID  {printf("Missing closing parenthesis.\n");exit(0);}
     | ID '['  {printf("Missing size of array.\n");exit(0);}
     | ID
     ;
%%

int main(){
   printf("Enter the declarative statement: ");
   yyparse();
}

yyerror() {
	printf("Invalid declarative statement.\n");
	exit(1);
}
