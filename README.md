# CALCULADORA-BISON
## Funcionamiento de la Calculadora

### 1. Tokenización

La entrada se divide en tokens utilizando *Flex*. Los tokens reconocidos incluyen operadores aritméticos (`+`, `-`, `*`, `/`), paréntesis (`(`, `)`), números enteros, y el fin de línea. Los comentarios y espacios en blanco se ignoran. Cualquier carácter no reconocido genera un error.

### 2. Análisis

El parser, generado por *Bison*, toma los tokens del lexer y construye un árbol de sintaxis que representa la estructura de la expresión matemática. Este árbol organiza las operaciones y los operandos de acuerdo con las reglas de precedencia y asociación.

### 3. Evaluación

Finalmente, la expresión se evalúa recorriendo el árbol de sintaxis y calculando los resultados en cada nodo. El resultado final de la expresión se obtiene en la raíz del árbol, que es devuelto por la calculadora.

Esta implementación es un ejemplo básico de cómo se pueden utilizar *Flex* y *Bison* para construir un compilador o intérprete simple que maneja expresiones aritméticas.
