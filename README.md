# SimpleScript - Lenguaje de Programación

---

### Autor  
**Carlos Daniel Galvan Morales**  
Carné: 7590-20-16458

---

## 📖 Definición del Lenguaje

### 1. Nombre del Lenguaje  
**SimpleScript**

### 2. Palabras Clave y Operadores

#### 2.1 Palabras Clave Reservadas  
SimpleScript cuenta con un conjunto de palabras clave reservadas con significado especial y que no pueden usarse como identificadores.

| Categoría                  | Palabras Clave                         |
|---------------------------|--------------------------------------|
| Control de flujo           | IF, ELSE, WHILE, LOOP, RETURN, DO    |
| Definición variables y funciones | DEFINE, FUNCTION                  |
| Tipos de datos             | INT, FLOAT, STRING, BOOL              |
| Otros                     | PRINT                                |

#### 2.2 Operadores Soportados

##### 2.2.1 Operadores Aritméticos  
- `+` (suma)  
- `-` (resta)  
- `*` (multiplicación)  
- `/` (división)  

##### 2.2.2 Operadores Relacionales  
- `==` (igual a)  
- `!=` (diferente de)  
- `>` (mayor que)  
- `<` (menor que)  
- `>=` (mayor o igual que)  
- `<=` (menor o igual que)  

##### 2.2.3 Operadores Lógicos  
- `AND`  
- `OR`  
- `NOT`  

### 3. Definición de Tipos de Datos

#### 3.1 Tipos Primitivos  
SimpleScript soporta los siguientes tipos primitivos:

| Tipo   | Descripción                                |
|--------|--------------------------------------------|
| INT    | Enteros, 32 bits                           |
| FLOAT  | Números de punto flotante, precisión simple, 32 bits |
| STRING | Cadenas de caracteres Unicode, 16 bits    |
| TRUE   | Valores lógicos: `true`                   |
| FALSE   | Valores lógicos: `false`                   |

---

#Tabla de Tokens y Lexemas

| Lexema                  | Expresión Regular        | Token     |
| ----------------------- | ------------------------ | --------- |
| FUNCTION                | FUNCTION                 | FUNCTION  |
| RETURN                  | RETURN                   | RETURN    |
| DEFINE                  | DEFINE                   | DEFINE    |
| PRINT                   | PRINT                    | PRINT     |
| IF                      | IF                       | IF        |
| ELSE                    | ELSE                     | ELSE      |
| ELSEIF                  | ELSEIF                   | ELSEIF    |
| WHILE                   | WHILE                    | WHILE     |
| LOOP                    | LOOP                     | LOOP      |
| DO                      | DO                       | DO        |
| THEN                    | THEN                     | THEN      |
| END                     | END                      | END       |
| Número entero           | `[d]+`                   | NUMERO    |
| Número flotante         | `[d]+.[d]+`              | DECIMAL   |
| Cadena                  | `[a-zA-Z_][a-zA-Z0-9_]*` | CADENA    |
| TRUE                    | `true`                   | TRUE      |
| FALSE                   | `false`                  | FALSE     |
| Identificador           | `[a-zA-Z_][a-zA-Z0-9_]*` | ID        |
| Operador Suma           | `+`                      | PLUS      |
| Operador Resta          | `-`                      | MINUS     |
| Operador Multiplicación | `*`                      | MULT      |
| Operador División       | `/`                      | DIV       |
| Operador Igual          | `==`                     | EQ        |
| Operador Diferente      | `!=`                     | NEQ       |
| Operador Mayor Que      | `>`                      | GT        |
| Operador Menor Que      | `<`                      | LT        |
| Operador Mayor o Igual  | `>=`                     | GTE       |
| Operador Menor o Igual  | `<=`                     | LTE       |
| Operador Y              | AND                      | AND       |
| Operador O              | OR                       | OR        |
| Operador Negación       | NOT                      | NOT       |
| Paréntesis Apertura     | `(`                      | LPARENT   |
| Paréntesis Cierre       | `)`                      | RPARENT   |
| Coma                    | `,`                      | COLOM     |
| Punto y Coma            | `;`                      | SEMICOLOM |

## 🚀 Informe Final
# Descripción del Desarrollo
La aplicación fue desarrollada utilizando el framework Spring Boot con Java JDK 17, gestionando dependencias con Maven para integrar las librerías de JFLEX y CUP, esenciales para el analizador léxico.

El front-end se implementó con React, logrando una interfaz interactiva y moderna.

El despliegue se realizó en un servidor Ubuntu 24 LTS, con un servidor Tomcat 10.1.41 configurado para publicar la aplicación.

La aplicación está disponible en la siguiente URL:
http://93.127.139.74:8080

Gracias por revisar este proyecto. Para cualquier duda o aporte, no dudes en contactarme.


## 💻 Ejemplo de Código en SimpleScript

```simplescript
FUNCTION factorial(n)
    DEFINE resultado = 1;
    WHILE n > 1 DO
        resultado = resultado * n;
        n = n - 1;
    END
    RETURN resultado;
END

DEFINE num = 5;
DEFINE fact = factorial(num);
PRINT "El factorial de ", num, " es ", fact;

IF fact > 18 THEN
    PRINT "El resultado es mayor que 18";
ELSE
    PRINT "El resultado es menor o igual a 18";
END
