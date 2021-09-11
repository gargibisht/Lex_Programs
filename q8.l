/* Q8. A program in Lex to recognize a valid arithmetic expression. */

%option noyywrap
%{
#include<stdio.h>
int b=0,op=0,ident=0,flag=0;
%}

%%
[a-zA-Z]+[0-9A-Za-z]* {ident++;}
[0-9]+ {ident++;}
[\+\-\*/\=] {op++;}
"(" {b++;}
")" {b--;}
";" {flag=1;}
.|\n {return 0;}
%%

int main()
{
printf("Enter the expression : ");
yylex();
if((op+1)==ident && b==0 && flag==0)
{
printf("\nExpression is Valid");
printf("\nNo of identifier = %d \nNo of Operators = %d \n",ident,op);
}
else
printf("\nExpression is Invalid");
return 0;
}
