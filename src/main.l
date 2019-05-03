%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"
%}


%%

[+]      {
            return ADD;
        }

[-]      {
            return SUB;
        }

[0-9]+      {
                yylval = atoi(yytext);
                return N;
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
