%{
#include <stdio.h>
#include <stdlib.h>
%}

%token IDENTIFIER INT_KEYWORD SEMICOLON

%%
program: statement
       ;

statement: INT_KEYWORD declaration SEMICOLON
       ;

declaration: IDENTIFIER
       | IDENTIFIER ',' declaration
       ;

%%

int main() {
    yyparse();
    return 0;
}

void yyerror(const char *msg) {
    fprintf(stderr, "Error: %s\n", msg);
}


