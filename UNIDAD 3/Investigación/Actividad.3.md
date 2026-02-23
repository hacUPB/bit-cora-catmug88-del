# Actividad 3 

ok entonces la idea es explicar donde queda cada variable del programa según la parte de memoria que le corresponde. El programa tiene varias cosas declaradas y cada una va a parar a un lugar distinto dependiendo de cómo fue declarada.

---

## Las partes de la memoria (resumen rápido)

Básicamente la memoria del programa se divide en 4 zonas grandes:

- **Código**: donde están guardadas las instrucciones, o sea las funciones
- **Globales**: donde viven las variables que se declaran fuera de todo
- **Heap**: la memoria que pedimos nosotros a mano con `new`
- **Stack**: donde van las variables de dentro de las funciones, se crean y se borran solas

---

## Entonces, ¿donde queda cada cosa?

### Las funciones → Segmento de código

Todas las funciones del programa quedan guardadas acá. No importa cuál sea, si es una función, va al segmento de código:

- `main()`
- `suma()`
- `funcionConStatic()`
- `crearArrayHeap()`

Este segmento es de solo lectura, el programa no puede modificar sus propias instrucciones mientras corre.

---

### El texto "Hola, memoria de solo lectura" → Zona de solo lectura

El contenido de ese string no cambia nunca, entonces el compilador lo mete en una zona especial de solo lectura. El puntero `mensaje_ro` apunta hacia allá pero no puede modificar nada de eso.

---

### Variables globales → depende si tienen valor o no

**`global_inicializada = 42`** → va al segmento `.data` porque tiene un valor asignado desde el principio.

**`global_no_inicializada`** → va al segmento `.bss` porque no le pusimos ningún valor. El sistema le pone 0 automáticamente.

**`var_estatica = 100`** → aunque está declarada adentro de `funcionConStatic()`, como tiene la palabra `static`, se comporta como global. Va al `.data` también y su valor se mantiene entre llamadas a la función. Esto es importante porque uno pensaría que está en el Stack pero no.

---

### El array de 10 enteros → Heap

Cuando hacemos esto:

```cpp
int* arr = new int[10];
```

los 10 enteros se guardan en el Heap. Esa memoria no se libera sola, por eso al final del programa hay que hacer `delete[] arrayHeap`, si no se produce un memory leak.

Ojo: el puntero `arrayHeap` en sí (o sea la variable que guarda la dirección) vive en el Stack dentro de `main()`. Lo que está en el Heap son los datos a los que apunta.

---

### Variables locales de cada función → Stack

Estas se crean cuando la función empieza y se destruyen cuando termina:

**dentro de `main()`:**
- `a = 10`
- `b = 20`
- `c` (el resultado de suma)
- `tamArray = 10`
- `arrayHeap` (el puntero, no los datos)

**dentro de `suma()`:**
- los parámetros `a` y `b` (copias de los de main)
- la variable local `c`

**dentro de `crearArrayHeap()`:**
- el parámetro `tam`
- el puntero local `arr`

**dentro de `funcionConStatic()`:**
- nada, porque `var_estatica` no está en el Stack como ya se explicó arriba

---

## El mapa más o menos visual

```
+-----------------------------------------+
|  CÓDIGO                                 |
|  main, suma, funcionConStatic,          |
|  crearArrayHeap                         |
+-----------------------------------------+
|  SOLO LECTURA                           |
|  "Hola, memoria de solo lectura"        |
+-----------------------------------------+
|  GLOBALES (.data)                       |
|  global_inicializada = 42               |
|  var_estatica = 100                     |
+-----------------------------------------+
|  GLOBALES SIN VALOR (.bss)              |
|  global_no_inicializada (vale 0)        |
+-----------------------------------------+
|                                         |
|  HEAP  ↑                                |
|  los 10 int del array (new int[10])     |
|                                         |
+-----------------------------------------+
|                                         |
|  STACK  ↓                               |
|  variables locales de main()            |
|  variables locales de suma()            |
|  variables locales de crearArrayHeap()  |
|                                         |
+-----------------------------------------+
```

---

## Tabla resumen

| Variable o cosa | Dónde queda |
|---|---|
| `main()`, `suma()`, etc | Segmento de código |
| el string del mensaje | Zona de solo lectura |
| `global_inicializada` | .data |
| `var_estatica` | .data (no el stack!) |
| `global_no_inicializada` | .bss |
| los datos del `new int[10]` | Heap |
| `a`, `b`, `c` de main | Stack |
| parámetros de suma | Stack |
| puntero `arr` en crearArrayHeap | Stack |