%{
    #include <stdio.h>
    #include <string.h>

    #define HASHTAG '#'
    #define WHITESPACE ' '
    #define NHEADING 6

    unsigned int headings[] = {0, 0, 0, 0, 0, 0};

    unsigned int heading_level(char *s) {
        unsigned int i = 0;
        while (s[i] == HASHTAG) {
            i++;
        }
        return i;
    }

    char *strip_heading(char *s) {
        while (*s == '#' || *s == WHITESPACE) {
            s++;
        }
        return s;
    }

    void handle_heading(char *s) {
        unsigned int level = heading_level(s);
        if (level == 0 || level > 6) {
            return;
        }

        headings[level - 1]++;

        for(int i = level; i < NHEADING; i ++) {
            headings[i] = 0;
        }

        for (unsigned int i = 0; i < level; i++) {
            putchar(HASHTAG);
        }
        putchar(WHITESPACE);

        for (unsigned int i = 0; i < level; i++) {
            printf("%u.", headings[i]);
        }

        printf(" %s", strip_heading(s));
    }
%}

%%
^#{1,6}.*$ { handle_heading(yytext); }
.|\n       { ECHO; }
%%

int main(void) {
    yylex();
    return 0;
}

void yyerror(char *err) {
    printf("Error: %s", err);
}
