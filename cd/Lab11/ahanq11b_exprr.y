%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER

%%

input : expr { printf("%d\n", $1); }
      ;

expr : '(' '+' numbers ')' { $$ = sum($3); }
     | '(' '*' numbers ')' { $$ = product($3); }
     | '(' "max" numbers ')' { $$ = maximum($3); }
     | '(' "min" numbers ')' { $$ = minimum($3); }
     ;

numbers : NUMBER { $$ = $1; }
        | numbers NUMBER { $$ = $1 + $2; }
        ;

%%

int sum(int n) {
    return n;
}

int product(int n) {
    return n;
}

int maximum(int n) {
    return n;
}

int minimum(int n) {
    return n;
}

int yyerror(char *s) {
    printf("Error: %s\n", s);
    return 0;
}

int main() {
    yyparse();
    return 0;
}

