%{
#include <stdio.h>
int yylex();
void yyerror(const char *);
%}

%token NUMBER
%token ADD SUB MUL DIV
%token LPAREN RPAREN

%%

exp: exp ADD term     { printf("exp -> exp addop term\n"); $$ = $1 + $3; }
    | exp SUB term    { printf("exp -> exp addop term\n"); $$ = $1 - $3; }
    | term
    ;

term: term MUL factor { printf("term -> term mulop factor\n"); $$ = $1 * $3; }
    | factor
    ;
    
term: term DIV factor { printf("term -> term divop factor\n"); $$ = $1 / $3; }
    | factor
    ;


factor: LPAREN exp RPAREN   { printf("factor -> (exp)\n"); $$ = $2; }
      | NUMBER              { printf("factor -> number\n"); $$ = $1; }
      ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
}

