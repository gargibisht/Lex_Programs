/*Q1) Write a Lex program to count the number of lines and characters in the input file. */

%option noyywrap
%{
#include<stdio.h>
int linecount=0, charcount=0;
%}

/*Rule Section*/
%%
. charcount++;  //characters counter
\n {charcount++; linecount++;}//line counter
%%

int main()
{
	yyin=fopen("q1input.txt", "r");
	yylex();
	printf("\nNo. of lines = %d",linecount);
	printf("\nNo. of characters=%d\n", charcount);
}







