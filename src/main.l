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

([(][ \t]*[-][ \t][0-9]+[ \t]*[)]) {
            yylval = atoi(yytext);
            return N;
            }


[+]      {
            return ADD;
        }

[-]      {
            return SUB;
        }
^(\-[ \t][0-9]+) {
                yylval = atoi(yytext);
                return N;
            }

(\*[ \t]*\-[ \t][0-9]+) {
                return MUL_AND_N;
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
