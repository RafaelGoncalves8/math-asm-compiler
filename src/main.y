%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *c);
int yylex(void);
void print_mul();

int mul = 0;

%}

%token N ADD SUB MUL R_BRACKET L_BRACKET

%%

PROGRAM:
        E {
            printf("\\o/\n");
            return 0;
          }
        |
        ;

E:
    N {
        printf("mov r0, #%d\n", $1);
        printf("str r0, [r3]!\n");
        $$ = $1;
    }
    | L_BRACKET E R_BRACKET {
        $$ = $2;
    }
    | E MUL E {
        mul = 1;
        printf("b mul\n");
        $$ = $1 * $2;
      }
    | E ADD E {
        printf("ldr r2, [r3]!\n");
        printf("ldr r1, [r3]!\n");
        printf("add r0, r1, r2\n");
        $$ = $1 + $2;
      }
    | E SUB E {
        printf("ldr r2, [r3]!\n");
        printf("ldr r1, [r3]!\n");
        printf("add r0, r1, r2\n");
        $$ = $2 - $1;
      }
    ;

%%

void yyerror(char *s) {
    printf("Erro\n");
}

void print_mul(){
    printf("ldr r2, [r3]!\n");
    printf("ldr r1, [r3]!\n");
}

int main() {
  yyparse();
  if (mul)
    print_mul();
  return 0;
}
