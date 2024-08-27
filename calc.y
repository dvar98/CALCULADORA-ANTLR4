%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>

/* Declarar yylex y yyerror antes de su uso */
int yylex(void);
void yyerror(const char *s);
%}

%union {
    double dval;  /* Usamos double para representar valores numéricos */
}

%token <dval> NUMBER
%token SENO COSENO TANGENTE

%type <dval> expression

%%

calculation:
    expression '\n'  { printf("Resultado: %f\n", $1); }
    | /* vacío */
    ;

expression:
    NUMBER                    { $$ = $1; }
    | INTEGER                  {  $$ = $1;}
    | expression '+' expression  { $$ = $1 + $3; }
    | expression '-' expression  { $$ = $1 - $3; }
    | expression '*' expression  { $$ = $1 * $3; }
    | expression '/' expression  { $$ = $1 / $3; }
    | SENO '(' expression ')'    { $$ = sin($3 * M_PI / 180); }
    | COSENO '(' expression ')'  { $$ = cos($3 * M_PI / 180); }
    | TANGENTE '(' expression ')' { $$ = tan($3 * M_PI / 180); }
    ;

%%

int main() {
    printf("Ingrese una expresión:\n");
    yyparse();
    return 0;
}

void yyerror(const char *s) {
    fprintf(stderr, "Error: %s\n", s);
}