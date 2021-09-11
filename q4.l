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
