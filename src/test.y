%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *c);
int yylex(void);
%}

%token N ADD SUB MUL R_BRACKET L_BRACKET
%left ADD

%%

PROGRAMA:
        PROGRAMA EXPRESSAO { printf("Resultado: %d\n", $2); }
        |
        ;


EXPRESSAO:
    N { $$ = $1;
          }

    | EXPRESSAO ADD EXPRESSAO  {
        printf("Encontrei soma: %d + %d = %d\n", $1, $3, $1+$3);
        $$ = $1 + $3;
        }
    ;

%%

void yyerror(char *s) {
    printf("Erro\n");
}

int main() {
  yyparse();
  return 0;
}
