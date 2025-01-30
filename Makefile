CC = gcc

CFLAGS = -lfl

FLEX = flex

LEXER_SRC = src/lexer.ll
LEXER_C = lex.yy.c

README_SRC = docs/readme-src.md
README_OUT = readme.md

OUT = ssmd

$(OUT): $(LEXER_SRC)
	$(FLEX) $(LEXER_SRC)
	$(CC) $(LEXER_C) $(CFLAGS) -o $(OUT)

$(README_OUT): $(README_SRC) $(OUT)
	./$(OUT) < $(README_SRC) > $(README_OUT)

clean:
	rm $(LEXER_C) $(OUT)

default: $(OUT)