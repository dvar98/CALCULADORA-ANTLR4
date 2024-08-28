# Calculadora con Flex y Bison

Este proyecto implementa una calculadora básica utilizando Flex y Bison, que permite realizar operaciones aritméticas, bit a bit, y calcular valores absolutos. El proyecto está compuesto principalmente por dos archivos: `calculadora.l` (escáner léxico) y `calculadora.y` (analizador sintáctico).

## Características

- **Operaciones aritméticas:** Suma, resta, multiplicación, división.
- **Operaciones bit a bit:** AND, OR.
- **Cálculo de valores absolutos:** Utilizando `|` para encerrar el valor.
- **Soporte para números negativos.**
- **Conversión automática a hexadecimal para los resultados.**
- **Detección y manejo de errores comunes.**

## Requisitos

- Flex
- Bison
- GCC (o cualquier compilador compatible con C)

## Instalación

1. Clona el repositorio en tu máquina local:
    ```sh
    git clone https://tu-repositorio-url.git
    cd tu-repositorio
    ```

2. Genera los archivos de código a partir de los archivos de definición:
    ```sh
    flex calculadora.l
    bison -d calculadora.y
    ```

3. Compila el proyecto:
    ```sh
    gcc lex.yy.c calculadora.tab.c -o calculadora -lm
    ```

## Uso

Una vez compilada, puedes ejecutar la calculadora desde la línea de comandos:

```sh
./calculadora
```


## Ejemplos

``` 
Input: 3 + 5
Output: = 8.000000000000000000000 (decimal) = 8(hexadecimal)

Input: | -5 |
Output: = 5.000000000000000000000 (decimal) = 5(hexadecimal)

Input: 10 / 0
Output: No se puede dividir entre cero

Input: 5 - 5
Output: = 0 (decimal) = 0 (hexadecimal)

```

## Estructura del proyecto

- calculadora.l: Archivo de definición léxica que describe los patrones que deben ser reconocidos por el escáner.

- calculadora.y: Archivo de definición sintáctica que define las reglas de gramática y la lógica de la calculadora.

- calculadora.tab.h y calculadora.tab.c: Archivos generados por Bison que contienen las tablas de análisis sintáctico.calculadora.l: Archivo de definición léxica que describe los patrones que deben ser reconocidos por el escáner.
calculadora.y: Archivo de definición sintáctica que define las reglas de gramática y la lógica de la calculadora.
calculadora.tab.h y calculadora.tab.c: Archivos generados por Bison que contienen las tablas de análisis sintáctico.
lex.yy.c: Archivo generado por Flex que contiene el código del escáner léxic

- lex.yy.c: Archivo generado por Flex que contiene el código del escáner léxico

## Licencia 

Este proyecto está bajo la licencia MIT. Consulta el archivo LICENSE para más detalles.

## Equipo

- **Daniel Santiago Varela Guerrero**
- **Miguel Angel Velasco**
- **Sebastian Sabogal Castillo**
