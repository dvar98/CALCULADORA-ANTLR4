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

### Explicación:

Definición de Tokens: Aquí se definen los tokens que fueron identificados por el lexer. Estos tokens son utilizados por el parser para reconocer la estructura de la expresión matemática.

Tipo de Valor: YYSTYPE se define como int, lo que significa que los valores asociados a los tokens serán enteros (por ejemplo, los números leídos).

yylval: Es una variable global utilizada por el lexer para almacenar el valor del token actual. Este valor es luego utilizado por el parser durante el análisis sintáctico.

El parser usa estos tokens para construir un árbol de sintaxis que representa la expresión. Este árbol de sintaxis se organiza de manera que cada operación aritmética tiene sus operandos (números o expresiones anidadas) como hijos.

### 3. Evaluación



Finalmente, la expresión se evalúa recorriendo el árbol de sintaxis y calculando los resultados en cada nodo. El resultado final de la expresión se obtiene en la raíz del árbol, que es devuelto por la calculadora.

Esta implementación es un ejemplo básico de cómo se pueden utilizar *Flex* y *Bison* para construir un compilador o intérprete simple que maneja expresiones aritméticas.

## Documentación de Pruebas Funcionales
![Imagen de WhatsApp 2024-08-25 a las 21 56 13_ccfba494](https://github.com/user-attachments/assets/247d9495-d3c5-4399-bcd4-bcc5df76577e)



### Prueba 1: Operaciones Aritméticas Básicas

| **Operación**   | **Entrada** | **Salida Esperada** | **Salida Obtenida** | **Resultado** |
|-----------------|-------------|---------------------|---------------------|---------------|
| Suma            | `3 + 2`     | `= 5`               | `= 5`               | ✅ Éxito       |
| Resta           | `7 - 5`     | `= 2`               | `= 2`               | ✅ Éxito       |
| Multiplicación  | `4 * 3`     | `= 12`              | `= 12`              | ✅ Éxito       |
| División        | `10 / 2`    | `= 5`               | `= 5`               | ✅ Éxito       |

**Conclusión:** Todas las operaciones aritméticas básicas funcionaron correctamente y los resultados fueron los esperados.

### Prueba 2: Expresiones Complejas

| **Operación**                    | **Entrada**   | **Salida Esperada** | **Salida Obtenida** | **Resultado** |
|----------------------------------|---------------|---------------------|---------------------|---------------|
| Operación combinada sin paréntesis | `2 + 3 * 4` | `= 14`              | `= 14`              | ✅ Éxito       |
| Operación combinada con paréntesis | `(2 + 3) * 4` | `= 20`              | `= 20`              | ✅ Éxito       |

**Conclusión:** La calculadora respetó la precedencia de operadores y los paréntesis en las expresiones más complejas.

### Prueba 3: Manejo de Errores

| **Escenario**                | **Entrada** | **Salida Esperada**           | **Salida Obtenida**           | **Resultado** |
|------------------------------|-------------|--------------------------------|--------------------------------|---------------|
| Caracteres no válidos         | `3 + x`     | Error: Carácter no válido `x`  | `error: Mystery character x`   | ✅ Éxito       |

**Conclusión:** La calculadora manejó correctamente la entrada con caracteres no válidos, mostrando un mensaje de error adecuado.

---

### Resumen

Las pruebas demostraron que la calculadora funciona correctamente en todas las áreas probadas, incluyendo operaciones aritméticas básicas, manejo de expresiones complejas y detección de errores en la entrada. La calculadora produce resultados precisos y maneja errores de manera adecuada.
