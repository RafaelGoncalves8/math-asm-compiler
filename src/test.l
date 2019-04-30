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

[+]     {
          return ADD;
        }

[ \t]+ ;

%%

int yywrap() {
  return 1;
}
