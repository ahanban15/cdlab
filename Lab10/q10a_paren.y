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

/*anushka@anushka-hp:~$ lex lab.l
anushka@anushka-hp:~$ yacc lab.y
anushka@anushka-hp:~$ gcc lex.yy.c y.tab.c -o lab -lfl -w
anushka@anushka-hp:~$ ./lab
*/
