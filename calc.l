%{
#include "calc.tab.h"
%}

%%

sin     { return SENO; }
cos     { return COSENO; }
tan     { return TANGENTE; }

[0-9]+(\.[0-9]+)?  { yylval.dval = atof(yytext); return NUMBER; }
[+\-*/] { return yytext[0]; }
\(      { return '('; }
\)      { return ')'; }
[ \t]   { /* ignorar espacios en blanco */ }
\n      { return 0; }

.       { printf("Caracter desconocido: %s\n", yytext); }

%%

int yywrap() {
    return 1;
}