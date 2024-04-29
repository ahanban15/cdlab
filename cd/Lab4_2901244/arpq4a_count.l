
%{
#include<stdio.h>
int lc=0, sc=0, tc=0, wc=0, cc=0;    
int capitalLetters = 0;
int smallLetters = 0;
int numbers = 0;
int digits = 0;
int specialCharacters = 0;
int delimiters = 0;
int operators = 0;
int relationalOperators = 0;
%}


%%
[\n] { lc++; cc+=yyleng; }
[ \t] { sc++; cc+=yyleng; }
[A-Z] { capitalLetters++; cc+=yyleng; }
[a-z] { smallLetters++; cc+=yyleng; }
[0-9]+ { numbers++; digits+=yyleng; cc+=yyleng; }
[.,;:?!] { delimiters++; cc+=yyleng; }
[-+*/%^&|] { operators++; cc+=yyleng; }
[><=!]=? { relationalOperators++; cc+=yyleng; }
[^A-Za-z0-9 \t\n] { specialCharacters++; cc+=yyleng; }
[^\t\n ]+ { wc++; cc+=yyleng; }
 
%%

int yywrap(){ return 1; }


int main(){
    printf("Enter the Sentence : ");
    yylex();
    printf("Number of lines: %d\n", lc);
    printf("Number of spaces: %d\n", sc);
    printf("Number of tabs: %d\n", tc);
    printf("Number of words: %d\n", wc);
    printf("Number of characters: %d\n", cc);
    printf("Number of capital letters: %d\n", capitalLetters);
    printf("Number of small letters: %d\n", smallLetters);
    printf("Number of numbers: %d\n", numbers);
    printf("Number of digits: %d\n", digits);
    printf("Number of special characters: %d\n", specialCharacters);
    printf("Number of delimiters: %d\n", delimiters);
    printf("Number of operators: %d\n", operators);
    printf("Number of relational operators: %d\n", relationalOperators);
    return 0;
}



/*
anushka@anushka-hp:~$ flex count.l
anushka@anushka-hp:~$ gcc lex.yy.c -o count -lfl
anushka@anushka-hp:~$ ./count
Enter the Sentence : Anushka
Number of lines: 1
Number of spaces: 0
Number of tabs: 0
Number of words: 1
Number of characters: 8
Number of capital letters: 0
Number of small letters: 0
Number of numbers: 0
Number of digits: 0
Number of special characters: 0
Number of delimiters: 0
Number of operators: 0
Number of relational operators: 0
*/

