%{
#include <stdio.h>
#include <stdlib.h>
%}

%token NUMBER PLUS MULTIPLY LPAREN RPAREN
%left PLUS
%left MULTIPLY

%%

E: E PLUS T   { printf("%d ", $1); printf("%d + ", $3); }
 | T
 ;

T: T MULTIPLY F   { printf("%d ", $1); printf("%d * ", $3); }
 | F
 ;

F: LPAREN E RPAREN   { printf("("); printf("%d", $2); printf(") "); }
 | NUMBER   { printf("%d ", $1); }
 ;

%%

int main() {
    yyparse();
    printf("\n");
    return 0;
}

int yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
    return 1;
}

