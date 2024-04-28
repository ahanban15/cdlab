%{ 
/* Definition section */
#include<stdio.h> 
#include<stdlib.h> 
void yyerror(char *s); 
%} 

/* Token Section */
%token INTEGER
%token DOT
%token FRACTION
%token NUMBER

/* Rule Section */
%% 
N: L {printf("\n%f", $$);} 
L: INTEGER DOT FRACTION { $$ = $1*2 + $3; }
 | INTEGER { $$ = $1; } 
B: NUMBER {$$=$1;} 

%% 

//driver code 
int main() 
{ 
    while(yyparse()); 
} 

void yyerror(char *s) 
{ 
    fprintf(stdout, "\n%s", s); 
}

