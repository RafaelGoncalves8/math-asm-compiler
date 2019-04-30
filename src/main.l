%{
#include <stdlib.h>
void yyerror(char *);

#include "y.tab.h"

%}

DIGIT [0-9]

%%

DIGIT*  {
            return N;
        }

\(\-DIGIT*\) {
                return N;
             }

\+      {
            return ADD;
        }

\-      {
            return SUB;
        }

\*      {
            return MUL;
        }

\(      {
            return L_BRACKET;
        }

\)      {
            return R_BRACKET;
        }


[ \t\n]+ ;

.       {
            return CHAR;
        }


%%

int yywrap() {
  return 1;
}
