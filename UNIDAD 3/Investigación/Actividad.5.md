# Actividad 5: Copia de objetos

Ejecuté los dos programas con el depurador y fui observando paso a paso qué le pasaba a cada variable.

---

## Experimento en C++

La salida que obtuve fue:

```
Constructor: Punto original (70, 80) creado.
Punto original(70, 80)
Punto copia(100, 200)
Punto original(70, 80)
Punto p(300, 400)
Punto p(300, 400)
Destructor: Punto p(300, 400) destruido.
Destructor: Punto copia(100, 200) destruido.
```

### Parte 1: la copia

Cuando se ejecuta `Punto copia = original`, C++ crea un objeto nuevo en el stack con los mismos valores que `original`. A partir de ese momento los dos objetos son independientes. Esto lo pude comprobar porque al cambiarle x e y a `copia`, `original` mantuvo sus valores originales (70, 80).

Algo que me generó confusión al principio fue que el constructor solo se llama una vez. Pensé que al hacer la copia debería llamarse de nuevo, pero no es así. C++ usa un constructor de copia por defecto que se encarga de duplicar los datos sin imprimir nada (porque nosotros no lo definimos).

### Parte 2: el puntero

El puntero `p` apunta a la misma dirección de memoria donde vive `original`. Esto significa que `p` y `original` son exactamente el mismo objeto, solo que accedido de dos maneras distintas. Cuando hago `p->x = 300`, en realidad estoy modificando `original` directamente. Eso explica por qué al final `original.imprimir()` muestra 300 y 400 aunque nunca escribí `original.x = 300`.

Esta distinción entre copia y puntero me pareció muy importante para entender cómo funciona la memoria.

### Los destructores

Al terminar el programa, el stack se libera y los destructores se llaman automáticamente. Se llaman en orden inverso al de creación (primero el de `original` y después el de `copia`), aunque los nombres ya habían cambiado así que en la salida aparecen como "p" y "copia".

---

## Experimento en C#

La salida fue:

```
Constructor: Punto original(70, 80) creado.
Punto original(70, 80)
Punto copia(100, 200)
Punto copia(100, 200)
```

### La diferencia grande

En C# la línea `Punto copia = original` no crea un objeto nuevo. Copia la referencia, o sea la dirección de memoria del objeto. Después de esa línea, `copia` y `original` son dos variables que apuntan al mismo objeto en el heap.

La consecuencia de esto es que al hacer `copia.x = 100`, en realidad estoy modificando el objeto al que `original` también apunta. Por eso cuando llamo `original.Imprimir()` al final, muestra 100 y 200 en lugar de 70 y 80. Que en este caso sea lo mismo que `copia` lo confirma.

Esto en C# se llama tipo por referencia y es el comportamiento por defecto de todas las clases.

---

## Reflexión final

**Pregunta 1: ¿Qué ocurre al copiar un objeto en C++ y en C#?**

En C++ copiar un objeto con `Punto copia = original` crea un objeto completamente nuevo con sus propios datos en el stack. Los dos objetos viven en direcciones de memoria distintas y son totalmente independientes.

En C# la misma sintaxis no copia el objeto sino la referencia. El objeto sigue siendo uno solo en el heap y ahora hay dos variables apuntando a él. Cualquier cambio hecho a través de cualquiera de las dos variables afecta al mismo objeto.

**Pregunta 2: ¿Qué es `copia` en cada lenguaje?**

En C++, `copia` es un objeto independiente. Tiene su propia dirección de memoria y sus propios valores. No tiene ninguna relación con `original` después de ser creada.

En C#, `copia` es solo otra variable que guarda la misma referencia que `original`. No existe un segundo objeto, existe un segundo nombre para llegar al mismo objeto. Si se quisiera una copia real en C# habría que implementarlo manualmente, por ejemplo con un método que cree un objeto nuevo y copie los valores uno por uno.

La razón de esta diferencia es que en C++ los objetos pueden ser tipos valor (vivir directamente en el stack) mientras que en C# las clases son siempre tipos por referencia y viven en el heap.


# Actividad Integradora

---

## Parte A: Predicción

### Preguntas 1 y 2 - Salida esperada

Antes de ejecutar el programa lo leí varias veces para entender qué hace cada función.

Para el bloque de paso de parámetros: `val_A` no debería cambiar porque se pasa por valor (se manda una copia). `val_B` y `val_C` sí deberían cambiar porque se pasan por referencia y por puntero respectivamente, que son formas distintas de llegar al mismo resultado: modificar la variable original.

Para el bloque de `ejecutarContador`: como `contador_estatico` es estática, no se reinicia entre llamadas. Empieza en 0 y se incrementa cada vez, así que las tres llamadas deberían mostrar 1, 2 y 3.

Salida que predije:

```
--- Experimento con paso de parámetros ---
Valor inicial de val_A: 20
  -> Dentro de sumaPorValor, 'a' ahora es: 30
Valor final de val_A: 20

Valor inicial de val_B: 20
  -> Dentro de sumaPorReferencia, 'a' ahora es: 30
Valor final de val_B: 30

Valor inicial de val_C: 20
  -> Dentro de sumaPorPuntero, '*a' ahora es: 30
Valor final de val_C: 30

--- Experimento con variables estáticas ---
  -> Llamada a ejecutarContador. Valor de contador_estatico: 1
  -> Llamada a ejecutarContador. Valor de contador_estatico: 2
  -> Llamada a ejecutarContador. Valor de contador_estatico: 3
```

### Pregunta 3 - Mapa de memoria

Traté de dibujar cómo quedaría la memoria justo antes de que `main` termine, cuando ya se llamaron todas las funciones pero todavía no salimos de `main`.

```
+--------------------------------------------+
|            SEGMENTO DE CÓDIGO              |
|                                            |
|  main(), sumaPorValor(),                   |
|  sumaPorReferencia(), sumaPorPuntero(),     |
|  ejecutarContador()                        |
|                                            |
+--------------------------------------------+
|        DATOS GLOBALES / ESTÁTICOS          |
|                                            |
|  contador_global = 100   → segmento .data  |
|  contador_estatico = 3   → segmento .data  |
|    (aunque está declarada dentro de una    |
|     función, static la saca del stack)     |
|                                            |
+--------------------------------------------+
|                  HEAP                      |
|                                            |
|  (no se usó, no hay new en el programa)    |
|                                            |
+--------------------------------------------+
|                 STACK                      |
|                                            |
|  Frame de main():                          |
|    val_A = 20   ← no cambió (paso valor)  |
|    val_B = 30   ← cambió (por referencia) |
|    val_C = 30   ← cambió (por puntero)    |
|                                            |
|  Los frames de sumaPorValor,               |
|  sumaPorReferencia, sumaPorPuntero y       |
|  ejecutarContador ya no existen porque     |
|  esas funciones ya retornaron.             |
|                                            |
|  Nota: el parámetro 'a' de sumaPorValor    |
|  vivió en su propio frame mientras duró    |
|  la función. Ya no está.                   |
+--------------------------------------------+
```

---

## Parte B: Verificación

### Pregunta 4 - Comparación con la predicción

La salida real coincidió exactamente con lo que predije, lo cual me dio bastante confianza de haber entendido bien los conceptos.

Para la verificación usé breakpoints en los siguientes puntos que me parecieron clave:

- Al inicio de `main`, antes de cualquier llamada, para tener una referencia de los valores iniciales.
- En la primera línea dentro de `sumaPorValor`, para ver el valor de `a` y compararlo con `val_A` en el frame de `main`.
- En la primera línea dentro de `sumaPorReferencia`, para confirmar que `a` y `val_B` comparten dirección.
- Al entrar a `ejecutarContador` en cada una de las tres llamadas, para observar cómo `contador_estatico` va aumentando.

En la pestaña Autos del depurador se podía ver claramente las variables de la función activa y las del frame anterior. Eso fue útil para confirmar qué estaba pasando en cada caso.

### Pregunta 5 - Qué muestran las capturas sobre los tipos de paso

Lo más revelador que se puede observar en el depurador es comparar las direcciones de memoria de las variables.

Con `sumaPorValor`: la variable `a` dentro de la función tiene una dirección distinta a `val_A` en `main`. Eso confirma que son dos espacios distintos en el stack. Cuando `a` se modifica a 30, `val_A` permanece en 20 porque son lugares distintos de memoria.

Con `sumaPorReferencia`: dentro de la función, si se inspecciona la dirección de `a`, es la misma que la de `val_B`. No hay copia. Es el mismo espacio de memoria con dos nombres distintos según desde dónde se mire.

Con `sumaPorPuntero`: el parámetro `a` es un puntero, así que su valor es una dirección de memoria (la de `val_C`). Al hacer `*a` se accede al contenido de esa dirección. El efecto final es igual al de la referencia pero el mecanismo es explícito: uno ve claramente que está desreferenciando un puntero.

### Pregunta 6 - Por qué contador_estatico recuerda su valor

Una variable local normal vive en el stack. Cada vez que una función es llamada, se crea un frame nuevo en el stack donde se alojan sus variables locales. Cuando la función retorna, ese frame se destruye y las variables desaparecen. La próxima llamada crea un frame nuevo y las variables vuelven a inicializarse desde cero.

`contador_estatico` tiene `static` delante, lo que cambia completamente su ciclo de vida. El compilador no la pone en el stack sino en el segmento de datos estáticos, que es la misma zona donde viven las variables globales. La inicialización (`= 0`) solo ocurre una vez, la primera vez que el programa pasa por esa línea. En las llamadas siguientes esa línea se ignora y la variable conserva el valor que tenía al salir de la última llamada.

Por eso en la primera llamada `contador_estatico` vale 1, en la segunda 2 y en la tercera 3. Nunca vuelve a 0 porque nunca se destruye.

La diferencia con una variable local normal es el tiempo de vida. Una variable local existe solo entre el momento en que la función entra y el momento en que sale. Una estática local existe desde la primera vez que la función es llamada hasta que el programa termina. El scope (desde dónde se puede usar) sigue siendo el mismo: solo desde dentro de `ejecutarContador`. Pero en memoria, vive como si fuera global.