%{
#include <stdio.h>
#include <stdlib.h>

void yyerror(char *c);
int yylex(void);
void print_mul();
void print_init();

int mul = 0;
int b_count = 0;
int n;

%}

%token N ADD SUB MUL R_BRACKET L_BRACKET
%left ADD SUB

%%

PROGRAM:
        E {
            //printf("%d\n", $1);
            return 0;
          }
        |
        ;

E:
    N {
        printf("        mov r0, #%d\n", $1);
        printf("        str r0, [r10], #4\n");
        $$ = $1;
    }
    | L_BRACKET E R_BRACKET {
        $$ = $2;
    }
    | E MUL E {
        mul = 1;
        printf("        bl mul\n");
        printf("        str r0, [r10], #4\n");
        $$ = $1 * $2;
      }
    | E ADD E {
        printf("        ldr r2, [r10, #-4]!\n");
        printf("        ldr r1, [r10, #-4]!\n");
        printf("        add r0, r1, r2\n");
        printf("        str r0, [r10], #4\n");
        $$ = $1 + $2;
      }
    | E SUB E {
        printf("        ldr r2, [r10, #-4]!\n");
        printf("        ldr r1, [r10, #-4]!\n");
        printf("        sub r0, r1, r2\n");
        printf("        str r0, [r10], #4\n");
        $$ = $1 - $2;
      }
    | SUB E {
        printf("        ldr r1, [r10, #-4]!\n");
        printf("        sub r0, #1, r1\n");
        printf("        str r0, [r10], #4\n");
        $$ = $1 - $2;
    }
    ;

%%

void yyerror(char *s) {
    printf("Expressão inválida.\n");
}

void print_mul(){
    printf("        end\n");
    printf("mul     ldr r2, [r10, #-4]!\n");
    printf("        ldr r1, [r10, #-4]!\n");
    printf("        mov r0, #0\n");
    printf("loop    cmp r1, #0\n");
    printf("        ble endmul\n");
    printf("        add r0, r0, r2\n");
    printf("        sub r1, r1, #1\n");
    printf("        b loop\n");
    printf("endmul  mov pc, lr\n");
}


void print_init(){
    printf("        mov r10, #3200\n");
}

int main() {
  print_init();
  yyparse();
  if (mul)
    print_mul();
  return 0;
}
