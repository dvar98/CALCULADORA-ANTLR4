# CALCULADORA-BISON
## Funcionamiento de la Calculadora

### 1. Tokenización

La entrada se divide en tokens utilizando *Flex*. Los tokens reconocidos incluyen operadores aritméticos (`+`, `-`, `*`, `/`), paréntesis (`(`, `)`), números enteros, y el fin de línea. Los comentarios y espacios en blanco se ignoran. Cualquier carácter no reconocido genera un error.
## Código del Lexer (`fb1-5.l`)

```
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
```
### 2. Análisis

El parser, generado por *Bison*, toma los tokens del lexer y construye un árbol de sintaxis que representa la estructura de la expresión matemática. Este árbol organiza las operaciones y los operandos de acuerdo con las reglas de precedencia y asociación.


```
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   enum yytokentype {
     NUMBER = 258,
     ADD = 259,
     SUB = 260,
     MUL = 261,
     DIV = 262,
     ABS = 263,
     OP = 264,
     CP = 265,
     EOL = 266
   };
#endif

/* Tokens.  */
#define NUMBER 258
#define ADD 259
#define SUB 260
#define MUL 261
#define DIV 262
#define ABS 263
#define OP 264
#define CP 265
#define EOL 266

typedef int YYSTYPE;
extern YYSTYPE yylval;
```
### 3. Evaluación

Finalmente, la expresión se evalúa recorriendo el árbol de sintaxis y calculando los resultados en cada nodo. El resultado final de la expresión se obtiene en la raíz del árbol, que es devuelto por la calculadora.

Esta implementación es un ejemplo básico de cómo se pueden utilizar *Flex* y *Bison* para construir un compilador o intérprete simple que maneja expresiones aritméticas.
