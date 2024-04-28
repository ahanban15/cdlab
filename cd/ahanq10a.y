%{
#include <stdio.h>
%}

%token a
%left '+'

%%

P : '(' P ')' { 
        if ($2 == 'a') {
            $$ = 1; // unbalanced parentheses
            yyerror("Unbalanced parentheses!");
        } else {
            $$ = $2 + 1; // balanced parentheses, increment count
        }
    }
  | a {$$ = 0;} /* base case */
  ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    return 0;
}


