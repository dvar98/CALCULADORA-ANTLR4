%option noyywrap nodefault yylineno
%{
	#include "calculadora.tab.h"
	#include <stdio.h>
	#include <stdlib.h>

%}


%%
"+" { return ADD; }
"-" { return SUB; }
"*" { return MUL; }
"/" { return DIV; }
"|" { return ABS; }
"(" { return OP;  }
")" { return CP;  }
"&" { return AND; }
"||" { return OR; }

[0-9]+ 		{ yylval.dval = atof(yytext); return NUMBER; }
[0-9]+\.[0-9]+ { yylval.dval = atof(yytext); return NUMBER;}
"-"[0-9]+ 		{ yylval.dval = -atof(yytext + 1); return NUMBER; }
"-"[0-9]+\.[0-9]+ { yylval.dval = -atof(yytext + 1); return NUMBER;}
\n 			{ return EOL; }
[ \t]   	{ /* ignore white space */ }
"//".* 		{  }
. 			{ printf("Mystery character %c\n", *yytext); }
%%
