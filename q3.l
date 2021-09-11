/* Q3) Write a Lex program that finds the longest word (defined as a contiguous string of upper- and lower-case letters) in the input. */

/* a) Here values are taken from the Standard Input ~ */

%{
#include <strings.h>

int counter = 0;
char longword[150];
%}

%%
[a-zA-Z]+ {if (yyleng > counter) 
		        {
                 counter = yyleng;
                 strcpy (longword, yytext);
                }
           }
                
%%
int main (void) {
   yylex ();
   printf ("The longest word was \"%s\", which was %d characters long.\n", longword, counter);
   return 0;
                }


/* b) Here values are taken from the file q3input.txt ~*/

%{
#include <strings.h>
int counter = 0;
char longword[150];
%}

%%
[a-zA-Z]+ {if (yyleng > counter) 
		{
                 counter = yyleng;
                 strcpy (longword, yytext);
                }
          }
                
%%
int main (void) {
   yyin=fopen("q3input.txt","r");
   yylex ();
   printf ("The longest word was \"%s\", which was %d characters long.\n", longword, counter);
   return 0;
   }

