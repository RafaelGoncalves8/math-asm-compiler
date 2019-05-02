# Compilation macros
CC=gcc
CFLAGS=-Wextra -lfl
LEX=flex
YACC=bison

# Files
DIR=src
YYTABH=$(DIR)/y.tab.h
YYTABC=$(DIR)/y.tab.c
LEXOUT=$(DIR)/lex.yy.c
YACCFILE=$(DIR)/main.y
LEXFILE=$(DIR)/main.l
TARGET=./main

# Git
REMOTE=origin
BRANCH=master

# Out script
BASH=sh
OUT_SCRIPT=out.sh

all:$(TARGET)

$(TARGET):$(LEXOUT) $(YYTABC)
	$(CC) -o$(TARGET) $(LEXOUT) $(YYTABC) $(CFLAGS)

$(LEXOUT):$(LEXFILE) $(YYTABC)
	$(LEX) -o$(LEXOUT) $(LEXFILE)

$(YYTABC):$(YACCFILE)
	$(YACC) -o$(YYTABC) -dy $(YACCFILE)

out:all
	$(BASH) $(OUT_SCRIPT) $(TARGET)

commit:
	git commit -a

push:
	git push $(REMOTE) $(BRANCH)

clean:
	$(RM) $(YYTABC)
	$(RM) $(YYTABH)
	$(RM) $(LEXOUT)
	$(RM) ./$(TARGET)
	$(RM) $(DIR)/*.o
	$(RM) ./$(ZIPFILE)
