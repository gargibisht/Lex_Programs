/* Q7. Write a Lex specification program that generates a C program which takes a string “abcd” and prints the following output. abcd abc ab a*/

%option noyywrap
%{
%}
%%
[A-Za-z]+ {int len=yyleng;
	   int i=len;
	   printf("\n");
	   while(i>=0) 
	   {
	     int j=0;
	     while(j<i) 
	     {
		printf("%c",yytext[j]);
		j++;
	     } 
	     printf("\n");
	     i--;
	   }
	  } 
%%
int main()
{
printf("Enter the string : ");
yylex();
}
