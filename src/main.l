%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
%}


%%

[0-9]+  {
            yylval = atoi(yytext);
            return N;
        }

([(][-][0-9]+[)]) {
            yylval = atoi(yytext);
            return N;
            }


[+]      {
            return ADD;
        }

[-]      {
            return SUB;
        }

[*]      {
            return MUL;
        }

[(]      {
            return L_BRACKET;
        }

[)]      {
            return R_BRACKET;
        }


[ \t\n]+ ;

%%

int yywrap() {
  return 1;
}
