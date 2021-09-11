/*Q1) Write a Lex program to count the number of lines and characters in the input file. */

%option noyywrap
%{
#include<stdio.h>
int line_count=0, char_count=0;
%}

/*Rule Section*/
%%
. char_count++;  //characters counter
\n {char_count++; line_count++;}//line counter
%%

int main()
{
	yyin=fopen("q1input.txt", "r");
	yylex();
	printf("\nNo. of lines = %d",line_count);
	printf("\nNo. of characters=%d\n", char_count);
}







