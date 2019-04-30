%{
#include <stdio.h>
#include <stdlib.h>
void yyerror(char *c);
int yylex(void);
void print_mul(void);

int mul = 0;
%}

%token N ADD SUB MUL R_BRACKET L_BRACKET
%left ADD SUB MUL

%%

PROGRAM:
        E {return 0; }
        ;

E:
    N {
        $$ = $1;
        printf("mov r0, #%d\n", $1);
        printf("str r0, [r3]!\n");
      }
    | E MUL E {
        $$ = $1 * $2;
        mul = 1;
        printf("b mul\n");
      }
    | E ADD E {
        $$ = $1 + $2
        printf("ldr r2, [r3]!\n");
        printf("ldr r1, [r3]!\n");
        printf("add r0, r1, r2\n");
      }
    | E SUB E {
        $$ = $2 - $1
        printf("ldr r2, [r3]!\n");
        printf("ldr r1, [r3]!\n");
        printf("add r0, r1, r2\n");
    }
    | L_BRACKET E R_BRACKET {
        $$ = $2;
    }
    ;

%%
void yyerror(char *s) {
}

void print_mul(){
    printf("ldr r2, [r3]!\n");
    printf("ldr r1, [r3]!\n");
}

int main() {
  yyparse();
  if mul
    print_mul();
    return 0;
}
