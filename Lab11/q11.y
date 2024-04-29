%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(const char *s);
int yylex();

%}

%token NUMBER
%token PLUS TIMES MAX MIN
%left PLUS TIMES MAX MIN

%start S

%%

S: E { printf("%d\n", $1);exit(0); }
  ;

E: '(' PLUS L ')' { $$ = $3; }
 | '(' TIMES L1 ')' { $$ = $3; }
 | '(' MAX L2 ')' { $$ = $3; }
 | '(' MIN L3 ')' { $$ = $3; }
 ;

L: NUMBER { $$ = $1; }
 | L NUMBER { $$ = $1 + $2; };
 
L1: NUMBER { $$ = $1; }
 | L1 NUMBER { $$ = $1 * $2; };

L2: NUMBER { $$ = $1; }
 | L2 NUMBER { $$ = $1>$2 ?$1:$2; };

L3: NUMBER { $$ = $1; }
 | L3 NUMBER { $$ = $1<$2?$1:$2; };

%%

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}

int main() {
    printf("Enter an expression: ");
    yyparse();
    return 0;
}

