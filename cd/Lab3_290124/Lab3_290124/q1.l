%{
#include <stdio.h>
#include <stdlib.h>
%}

/*definitions*/
digit       [0-9]
letter      [a-zA-Z]
integer     {digit}+
float_number   {digit}+"."{digit}+
real_number    {integer}"E"[-+]?{integer}
identifier          {letter}({letter}|{digit})*

/*rules*/
%%
"for"|"while"|"if"|"else"  { printf("Keyword: %s\n", yytext); }
"++"|"--"|"+"|"-"   { printf("Operator: %s\n", yytext); }
{integer}           { printf("Literal (INT): %s\n", yytext); }
{float_number}         { printf("Literal (FLOAT): %s\n", yytext); }
{real_number}          { printf("Literal (REAL): %s\n", yytext); }
";"|","|"\""|"\\n"|"\\t"|"("|")"|"{"|"}"|" " { printf("Separator: %s\n", yytext); }
{identifier}                { printf("Identifier: %s\n", yytext); }
.                   { printf("Unrecognized token: %s\n", yytext); }
%%

/*user code function*/
int yywrap(){}
int main(int argc, char *argv[]) {
    yyin = fopen(argv[1], "r");
    yylex();
    fclose(yyin);
    return 0;
}

