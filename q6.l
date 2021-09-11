/*Q8. Write a Lex program to count the number of words, characters, blank spaces and lines in a C file. */

/*a) Values taken from c file named q6.c*/

%option noyywrap
%{
#include<stdio.h>
#include<string.h>
int yyerror(char *errormsg);
int wordc=0, bspacec=0, tspacec=0, linec=0, len=0;
%}

%%

(\n) { linec++; len++;
fprintf(yyout,"%s",yytext);
fprintf(yyout," [NEWLINE] ");
}

(" ") { bspacec++; len+=strlen(yytext);
fprintf(yyout,"%s",yytext);
fprintf(yyout," [BLANKSPACE] ");
}

(\t) { tspacec++; len+=strlen(yytext);
fprintf(yyout,"%s",yytext);
fprintf(yyout," [TAB] ");
}

[_a-zA-Z][_a-zA-Z0-9]{0,30}  {
wordc++; len+=strlen(yytext);
fprintf(yyout,"%s",yytext);
fprintf(yyout,"[WORD]");
}

. {
len += strlen(yytext);
fprintf(yyout,"%s",yytext);
fprintf(yyout,"[OTHERCHAR]");
}

%%

int main()
{
 yyin = fopen("q6.c","r");
yyout = fopen("result_q6.c","w");

yylex();

printf("\nNo of Words : %d ", wordc);
printf("\nNo of Characters : %d ", len);
printf("\nNo of Blank spaces : %d ", bspacec);
printf("\nNo of Tab spaces : %d ", tspacec);
printf("\nNo of Lines : %d ", linec);
printf("\n");

fprintf(yyout,"\nNo of Words : %d ", wordc);
fprintf(yyout,"\nNo of Characters : %d ", len);
fprintf(yyout,"\nNo of Blank spaces : %d ", bspacec);
fprintf(yyout,"\nNo of Tab spaces : %d ", tspacec);
fprintf(yyout,"\nNo of Lines : %d ", linec);
fprintf(yyout,"\n");

fclose(yyin);
fclose(yyout);
return 0;
}

int yyerror(char *errormsg)
{
fprintf(stderr, "%s\n", errormsg);
exit(1);
}

