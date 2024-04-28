%{
#include <stdio.h>
extern int yylex();
extern void yyerror(const char *);
%}

%token IDENTIFIER EQ NE

%%

input: /* empty */
     | input line
     ;

line: exp '\n' { printf("Valid Expression\n"); }
    | '\n' { /* Ignore empty lines */ }
    ;

exp: exp '&' exp_2 { printf("AND operation\n"); }
   | exp_2
   ;

exp_2: exp_3 '|' exp_2 { printf("OR operation\n"); }
     | exp_3
     ;

exp_3: exp_4 EQ exp_4 { printf("Equality comparison\n"); }
     | exp_4 NE exp_4 { printf("Inequality comparison\n"); }
     | exp_4
     ;

exp_4: '!' exp_5 { printf("Logical NOT\n"); }
     | exp_5
     ;

exp_5: IDENTIFIER { printf("Identifier: %s\n", yylex); }
     | '(' exp ')' 
     ;

%%

void yyerror(const char *s) {
    fprintf(stderr, "%s\n", s);
}

int main() {
    yyparse();
    return 0;
}

