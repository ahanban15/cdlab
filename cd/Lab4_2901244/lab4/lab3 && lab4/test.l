%option noyywrap
 
%{
    #include <stdio.h>
    #include <stdlib.h>
    #include <string.h>
    int lineno = 1; // initialize to 1
    int word = 0; // initialize to 0
    int rela_op = 0;
    int op = 0;
    int delim = 0;
    int spec = 0;
    int capsc=0;
    int smallc=0;
    void ret_print(char *token_type);
    void yyerror();
%}
%x ML_COMMENT
alpha       [a-zA-Z]
caps        [A-Z]
small       [a-z]
digit       [0-9]
alnum       {alpha}|{digit}
print       [ -~]
space       [ ]
 
ID          {alpha}+{alnum}*
ICONST      "0"|[0-9]{digit}*
FCONST      "0"|{digit}*"."{digit}+
CCONST      (\'{print}\')|(\'\\[nftrbv]\')
STRING      \"{print}*\"
SPACE       {space}
 
%%
 
"//".*                  { printf("Eat up comment at line %d\n", lineno); } 
 
"/*"                    { printf("Eat up comment from line %d ", lineno); BEGIN(ML_COMMENT); }
<ML_COMMENT>"*/"        { printf("to line %d\n", lineno); BEGIN(INITIAL); }
<ML_COMMENT>[^*\n]+     
<ML_COMMENT>"*"         
<ML_COMMENT>"\n"        { lineno += 1; }

 
"char"|"CHAR"           { word+=1; ret_print("KEYWORD_CHAR"); }
"int"|"INT"             { word+=1; ret_print("KEYWORD_INT"); }
"float"|"FLOAT"         { word+=1; ret_print("KEYWORD_FLOAT"); }
"double"|"DOUBLE"       { word+=1; ret_print("KEYWORD_DOUBLE"); }
"if"|"IF"               { word+=1; ret_print("KEYWORD_IF"); }
"else"|"ELSE"           { word+=1; ret_print("KEYWORD_ELSE"); }
"while"|"WHILE"         { word+=1; ret_print("KEYWORD_WHILE"); }
"for"|"FOR"             { word+=1; ret_print("KEYWORD_FOR"); }
"continue"|"CONTINUE"   { word+=1; ret_print("KEYWORD_CONTINUE"); }
"break"|"BREAK"         { word+=1; ret_print("KEYWORD_BREAK"); }
"void"|"VOID"           { word+=1; ret_print("KEYWORD_VOID"); }
"return"|"RETURN"       { word+=1; ret_print("KEYWORD_RETURN"); }
 
"+"                { op++; ret_print("ADDITION_OPERATION"); }
"-"                 { op++; ret_print("SUBTRACTION_OPERATION"); }
"*"                     { op++; ret_print("MULTIPLICATION_OPERATION"); }
"/"                     { op++; ret_print("DIVISION_OPERATION"); }
"++"              { op++; ret_print("INCREMENT"); }
"--"               { op++; ret_print("DECREMENT"); }
"||"                    { op++; ret_print("OR_OPERATION"); }
"&&"                    { op++; ret_print("AND_OPERATION"); }
"!"                     { op++; ret_print("NOT_OPERATION"); }
"=="|"!="               { op++; rela_op++; ret_print("EQUAL_OPERATION"); }
">"|"<"|">="|"<="       { op++; rela_op++; ret_print("RELATIONAL_OPERATION"); }
 
"("             { spec++; ret_print("LEFT_PARENTHESIS"); }
")"             { spec++; ret_print("RIGHT_PARENTHESIS"); }
"]"             { spec++; ret_print("LEFT_BRACKET"); }
"["             { spec++; ret_print("RIGHT_BRACKET"); }
"{"             { spec++; ret_print("LEFT_BRACE"); }
"}"             { spec++; ret_print("RIGHT_BRACE"); }
";"             { spec++; ret_print("SEMI_COLON"); }
"."             { spec++; ret_print("DOT"); }
","             { spec++; ret_print("COMMA"); }
"="             { op++; ret_print("ASSIGNMENT"); }
"&"             { spec++; ret_print("REFER"); }
 
{ID}            { word+=1; ret_print("IDENTIFIER"); }
{ICONST}        { word+=1; ret_print("ICONST"); }
{FCONST}        { word+=1; ret_print("FCONST"); }
{CCONST}        { word+=1; ret_print("CCONST"); }
{STRING}        { word+=1; ret_print("STRING"); }

"\n"            { lineno += 1; }
[ \t\r\f]+          /* eat up whitespace */
 
.               { yyerror("Unrecognized character"); }
%%
void ret_print(char *token_type){
    printf("yytext: %s\ttoken: %s\tlineno: %d \t words: %d\t operators: %d\t relational operators: %d\t special char: %d\t delimitors: %d\n", yytext, token_type, lineno,word,op,rela_op,spec,delim);
}
void yyerror(char *message){
    printf("Error: \"%s\" in line %d. Token = %s\n", message, lineno, yytext);
    //exit(1);
}
int main(int argc, char *argv[]){
   FILE* fp;
   char filename[50];
   printf("Enter the Filename: \n");
   scanf("%s",filename);
   fp = fopen(filename,"r");
   yyin = fp;
   yylex();
   fclose(yyin);
   return 0;
}

