# CALCULADORA-BISON
## Funcionamiento de la Calculadora

### 1. Tokenización

La entrada se divide en tokens utilizando *Flex*. Los tokens reconocidos incluyen operadores aritméticos (`+`, `-`, `*`, `/`), paréntesis (`(`, `)`), números enteros, y el fin de línea. Los comentarios y espacios en blanco se ignoran. Cualquier carácter no reconocido genera un error.
## Código del Lexer (`fb1-5.l`)

```c
%%
"+"    { return ADD; }
"-"    { return SUB; }
"*"    { return MUL; }
"/"    { return DIV; }
"|"    { return ABS; }
"("    { return OP; }
")"    { return CP; }
[0-9]+ { yylval = atoi(yytext); return NUMBER; }

\n     { return EOL; }
"//".*  
[ \t]  { /* ignore white space */ }
.      { yyerror("Mystery character %c\n", *yytext); }
%%


