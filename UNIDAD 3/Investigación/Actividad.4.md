# Actividad 4 

---

## Experimento 1

En este experimento el código intenta agarrar la dirección de la función main y escribir un 0 en esa dirección de memoria.

cuando lo ejecuté el programa se cerró de golpe con un error. en mi caso salió una ventana diciendo que el programa dejó de funcionar.

**¿Por qué pasa esto?**

Porque las funciones viven en el segmento de código y ese segmento es de solo lectura. es como intentar editar un archivo que está protegido contra escritura. el sistema operativo detecta que estás intentando escribir en una zona que no se puede tocar y mata el proceso directamente.

tiene sentido que esto sea así, si un programa pudiera modificar su propio código mientras corre podría pasar cualquier cosa rara.

---

## experimento 2

Acá es parecido al experimento 1. se toma la dirección del string `"Hola, memoria de solo lectura"` y se intenta escribir un 0 en esa posición.

El resultado es el mismo: el programa se rompe con un error de acceso a memoria.

**¿Por qué?**

Los strings literales que se ponen en el código así entre comillas quedan guardados en una zona de memoria protegida, igual que el código. el sistema no deja escribir ahí.

Una cosa que me parece interesante es que aunque el puntero `mensaje_ro` es una variable (vive en alguna parte), el contenido al que apunta, o sea el texto en sí, está en esa zona protegida. son cosas distintas: dónde vive el puntero y a dónde apunta.

---

## Experimento 3

Este sí funciona sin problemas. el programa imprime los valores iniciales, los cambia y luego imprime los nuevos:

```
global_inicializada: 42
global_no_inicializada: 0
global_inicializada: 69
global_no_inicializada: 666
```

**¿Por qué funciona acá y no en los anteriores?**

Porque estas variables globales no son constantes ni son código. viven en el segmento de datos que sí permite lectura y escritura. es el segmento pensado justamente para guardar datos que cambian.

Algo que me llamó la atención es que `global_no_inicializada` vale 0 y no un número aleatorio. eso pasa porque las variables globales sin valor asignado van al segmento `.bss` y ese segmento se inicializa en cero automáticamente cuando arranca el programa. no es magia, es que el sistema lo hace por nosotros.

---

## Experimento 4

Este código no compila directamente. el compilador dice que `var_estatica` no está declarada en ese scope.

Lo que pasa es que aunque `var_estatica` sea estática y viva en el segmento `.data`, su nombre solo existe dentro de `funcionConStatic()`. desde `main` es como si no existiera.

Esto me ayudó a entender una diferencia importante:

- **Tiempo de vida**: cuánto tiempo existe la variable en memoria → en las estáticas es todo el programa
- **Scope o alcance**: desde dónde puedo usar su nombre → sigue siendo solo dentro de la función donde fue declarada

Estas son dos cosas distintas y la palabra `static` solo cambia el tiempo de vida, no el scope.

**¿Qué pasa con las variables locales normales?**

Cuando entrás a una función se crean en el stack y cuando salís se destruyen. la próxima vez que llamás a la función empiezan de cero.

**¿Y con las estáticas?**

Se crean la primera vez que pasas por esa línea y se quedan vivas hasta que el programa termina. si volvés a llamar la función el valor que tenían sigue ahí.

---

## Experimento 5

Corrí el loop 5 veces y esto fue lo que salió:

```
Iteración 0
var_no_estatica: 100
var_estatica: 100
Iteración 1
var_no_estatica: 100
var_estatica: 101
Iteración 2
var_no_estatica: 100
var_estatica: 102
Iteración 3
var_no_estatica: 100
var_estatica: 103
Iteración 4
var_no_estatica: 100
var_estatica: 104
```

`var_no_estatica` siempre vale 100. cada vez que `funcionSinStatic` se llama, esa variable nace con 100, se le suma 1 (queda en 101) y cuando la función termina muere. la próxima llamada vuelve a nacer con 100. el `++` no sirve de nada porque la variable no sobrevive entre llamadas.

`var_estatica` en cambio sí recuerda su valor. la primera vez vale 100, se incrementa a 101 y cuando la función termina el valor 101 sigue guardado. la próxima llamada empieza desde 101, no desde 100.

**Diferencia principal:**
La no estática vive en el stack → muere con la función
la estática vive en `.data` → sobrevive entre llamadas

---

## Experimento 6

El programa reserva memoria para 5 enteros, los llena, los imprime, libera la memoria con `delete[]` y después intenta leer `arrayHeap[0]`.

Lo que me pasó cuando lo corrí fue que imprimió un número raro, no el 10 que estaba guardado antes. en otros casos el programa puede cerrarse con error, depende del sistema.

Esto es un bug muy feo que se llama **use after free**. básicamente estás leyendo (o escribiendo) en memoria que ya devolviste. esa memoria puede estar siendo usada por otra cosa o puede estar vacía, no hay forma de saber.

**Diferencias heap vs stack:**

| cosa | stack | heap |
|---|---|---|
| quién lo maneja | automático | el programador |
| cuándo se libera | al salir del bloque | cuando haces delete |
| qué pasa si olvidás liberar | nada, se libera solo | memory leak |

**¿Qué pasa si no hacés delete?**

La memoria queda ocupada pero ya nadie puede usarla. esto se llama memory leak. si el programa corre mucho tiempo o reserva mucha memoria sin liberar puede quedarse sin RAM. para programas pequeños no se nota pero en juegos o aplicaciones grandes es un problema grave.

**¿Por qué delete[] y no delete?**

Porque reservamos un arreglo con `new int[tam]`. el `delete[]` le avisa al sistema que tiene que liberar todo el bloque del arreglo. si usás `delete` sin corchetes solo libera el primer elemento correctamente y el resto puede quedar en un estado indefinido. siempre que uses `new[]` tenés que usar `delete[]`.