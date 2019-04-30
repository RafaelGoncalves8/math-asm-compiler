all:lex.yy.c y.tab.c
	gcc -omain lex.yy.c y.tab.c -lfl -Wall

lex.yy.c:src/main.l
	flex src/main.l

y.tab.c:src/main.y
	bison -dy src/main.y

test:all
	./main < test/01.in

out:all
	./main < test/01.in > 01.s

clean:
	rm y.tab.c lex.yy.c y.tab.h main
