/*Write a Lex program that distinguishes keywords, integers, floats, identifiers, operators, and comments in any simple programming language. */

/* a) Values taken from standard input */

%option noyywrap
%{
%}
%%
 {printf("Enter here :-\n\n");}
[0-9]* {printf("Integer\n");}
[0-9]+\.[0-9]+ {printf("Float\n"); }
int|float|if|else|printf|main|exit|switch|cout|cin|bool|auto|long|break|enum|register|typedef|case|return|char|short|unsigned|for|void|goto|sizeof|default|while|do|struct|class|include|iostream|using|namespace|std|double {printf("Keyword\n");}
[+|*|/|%|&|=|"|"|!|<|>] {printf("Operators\n");}
"-"|"--"|"<="|">="|"=="|"++"|"&&"|"||" {printf("Operators\n");}
[/]{1}[/]{1}[a-zA-Z0-9' '\t]* {printf("Single Line Comment\n");}
[/]{1}[*]{1}[a-zA-Z0-9' '\n\t]*[*]{1}[/]{1} {printf("MultiLine Comment\n");}
[_a-zA-Z][_a-zA-Z0-9]{0,30} {printf("Identifier\n");} 
[''|,|;|(|)|{|}|.|_] {printf("Delimitor\n");}
#|. {printf("Pre-Processor Directive\n");}
%%
int main()
{
   yylex ();
 
}

/*b) Values taken from input file */

%option noyywrap
%{
%}

%%
[0-9]* {printf("%s->Integer\n",yytext);}
[0-9]+\.[0-9]+ {printf("%s->Float\n",yytext); }
int|float|if|else|printf|main|exit|switch|cout|cin|bool|auto|long|break|enum|register|typedef|case|return|char|short|unsigned|for|void|goto|sizeof|default|while|do|struct|class|include|iostream|using|std|namespace|double {printf("%s->Keyword\n",yytext);}
[+|*|/|%|&|=|"|"|!|<|>] {printf("%s->Operators\n",yytext);}
"-"|"--"|"<="|">="|"=="|"++"|"&&"|"||" {printf("%s->Operators\n",yytext);}
[/]{1}[/]{1}[a-zA-Z0-9' '\t]* {printf("%s->Single Line Comment\n",yytext);}
[/]{1}[*]{1}[a-zA-Z0-9' '\n\t]*[*]{1}[/]{1} {printf("%s->MultiLine Comment\n",yytext);}
[_a-zA-Z][_a-zA-Z0-9]{0,30} {printf("%s->Identifier\n",yytext);} 
[''|,|;|(|)|{|}|.|_] {printf("%s->Delimitor\n",yytext);}
#.* {printf("%s->Pre-Processor Directive\n",yytext);}
%%

int main()
{
yyin=fopen("q4input.txt","r");
yylex ();
 
}


