/*Write a Lex program that implements the Caesar cipher: it replaces every letter with the one three letters after in alphabetical order, wrapping around at Z. E.g., a is replaced by d, b by e, and so on z by c.*/

/* a) Here values are taken from the Standard Input ~ */

%option main
%%
[a-z] {char ch = yytext[0];
ch += 3;
if (ch> 'z') ch -= ('z'+1- 'a');
printf ("%c" ,ch );
}
[A-Z] { char ch = yytext[0] ;
ch += 3;
if (ch> 'Z') ch -= ('Z'+1- 'A');
printf("%c",ch);
}
%%

/* b) Here values are taken from the file q2input.txt ~ */

%option noyywrap
%{
#include<stdio.h>
%}
%%
[a-wA-W] fprintf(yyout,"%c",yytext[0]+3);
[xyzXYZ] fprintf(yyout,"%c",yytext[0]-23);
%%

int main()
{
 yyin=fopen("q2input.txt","r");
 yyout=fopen("q2file2.txt","w");
 yylex();
}

