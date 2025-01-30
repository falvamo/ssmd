CC = gcc

CFLAGS = -lfl

FLEX = flex

LEXER_SRC = lexer.ll
LEXER_C = lex.yy.c

OUT = ssmd

$(OUT): $(LEXER_SRC)
	$(FLEX) $(LEXER_SRC)
	$(CC) $(LEXER_C) $(CFLAGS) -o $(OUT)

clean:
	rm $(LEXER_C) $(OUT)

default: $(OUT)