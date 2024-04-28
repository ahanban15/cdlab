/*
// Name: AHAN BANDYOPADHYAY
// Roll No.: 211210008
// CSB353 Compiler Design Lab5
//http://portcse.blogspot.com/2017/11/yacc-program-to-check-whether.html
*/

/* Q. Write a Yacc program to check if the entered statement is a valid arithmetic expression.*/ 


/* declaration section in this sections we will declare the different value and include the header file which we are using in this program to run this program */

%{
#include"y.tab.h"
extern int yylval;
%}

/* defined section */

%%
[0-9]+ {yylval=atoi(yytext); return NUMBER;}   //this is send to the yacc code as token INTEGER
[a-zA-Z]+ {return ID;}                                          //this is send to the yacc code as token  ID
[\t]+ ;
\n {return 0;}
. {return yytext[0];}
%%
