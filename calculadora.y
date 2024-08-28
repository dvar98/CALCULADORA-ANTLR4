%{
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
int yylex(void);
int yyerror(char* s);
%}

%union {
    double dval;
}

%token <dval> NUMBER
%token OP CP
%token ADD SUB MUL DIV ABS AND OR
%token EOL


%type <dval> exp
%type <dval> factor
%type <dval> term


%%

calclist:
    | calclist exp EOL { 
        if ($2 < 0){
            
            printf("= %.21f (decimal) = -%x(hexadecimal)\n", $2, (int)-$2);  
        }
        else{
            printf("= %21f (decimal) =  %x(hexadecimal)\n", $2, (int)$2);
        }
    } 
    | calclist EOL { /* Do nothing */ }
;

exp: factor
    | exp ADD factor { $$ = $1 + $3; }
    | exp SUB factor { $$ = $1 - $3; }
    | exp AND factor { $$ = (int)$1 & (int)$3; }
    | exp OR factor { $$ = $1 || $3; }
;

factor: term
    | factor MUL term { $$ = $1 * $3; }
    | factor MUL SUB term { $$ = -$1 * $4; }
    | factor DIV SUB term { $$ = -$1 / $4; }
    | factor DIV term {
        if ($3 == 0){
            printf("No se puede dividir entre cero\n");
            exit(1);
        } else {
            $$ = $1 / $3;
        }
    }
;

term: NUMBER
    | ABS term ABS {
        if($2 < 0){
            $$ = -$2;
        }
        else{
            $$ = $2;
        }
    }
    | OP exp CP { $$ = $2; }
;

%%
int main(int argc, char **argv)
{
    yyparse();
}

int yyerror(char *s)
{
    fprintf(stderr, "error: %s\n", s);
}
