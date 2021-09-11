/* Q5. Write a Lex program to count the number of identifiers in a C file. */ 

%option noyywrap
%{
#include<stdio.h>
#include<string.h>
int yyerror(char *errormsg);
int identifiercount=0;
int len=0;
%}

%%

#.* { fprintf(yyout,"%s",yytext);
fprintf(yyout," [PREPROCESSOR_DIRECTIVE] ");
len += strlen(yytext);
}

[''|,|;|(|)|{|}|.|_] {
fprintf(yyout,"%s",yytext);
fprintf(yyout,"[DELIM1]");
len += strlen(yytext);
}

[[]] {
fprintf(yyout,"[DELIM2]");
len += strlen(yytext);
}

int|float|if|else|printf|main|exit|switch|cout|cin|bool|auto|long|break|enum|register|typedef|case|return|char|short|unsigned|for|void|goto|sizeof|default|while|do|struct|class|include|iostream|using|namespace|std|double {
fprintf(yyout,"%s",yytext);
fprintf(yyout,"[KEYWORD]");
len += strlen(yytext);
}

[_a-zA-Z][_a-zA-Z0-9]{0,30}  {
identifiercount++;
len += strlen(yytext);
fprintf(yyout,"%s",yytext);
fprintf(yyout,"[IDENTIFIER]");
}

. {
len += strlen(yytext);
fprintf(yyout,"%s",yytext);
}

%%

int main()
{
 yyin = fopen("q5input.c","r");
yyout = fopen("counted_ident.c","w");

yylex();

printf("\nNo of Identifiers : %d ", identifiercount);
printf("\nNo of all characters : %d ", len);

fprintf(yyout,"\nNo of Identifiers : %d ", identifiercount);
fprintf(yyout,"\nNo of all characters : %d ", len);

fclose(yyin);
fclose(yyout);
return 0;
}

int yyerror(char *errormsg)
{
fprintf(stderr, "%s\n", errormsg);
exit(1);
}
