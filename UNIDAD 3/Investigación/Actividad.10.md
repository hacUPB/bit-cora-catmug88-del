# Actividad 10: Ciclo de Vida de un Objeto

## Primera parte

**1. Ciclo de vida: stack vs heap**

Un objeto en el **stack** nace cuando el programa llega a la línea donde se declara y muere solito cuando sale del bloque donde fue creado. Con el depurador lo vi claramente: el constructor de `pBloque` se llamó al entrar al bloque y el destructor se llamó automáticamente al salir, sin que yo hiciera nada.

Un objeto en el **heap** es diferente, nace cuando usamos `new` pero no muere solo. El programa no lo destruye al salir del bloque, sigue vivo hasta que nosotros llamemos `delete`. Si olvidamos el `delete`, el objeto queda ocupando memoria para siempre mientras el programa corre.

---

## Segunda parte (con `pBloque2` dentro del bloque)

**1. ¿Compila?**

No compila. El error ocurre en la línea `pBloque2->imprimir()` que está fuera del bloque, porque `pBloque2` fue declarado dentro del bloque y las variables solo existen dentro del bloque donde fueron declaradas. Al salir de las llaves `{}`, `pBloque2` deja de existir y el compilador ni siquiera lo reconoce afuera.

**2. Declarar `pBloque2` fuera e inicializarlo dentro**

Ahora sí compila y funciona. Como el puntero `pBloque2` fue declarado fuera del bloque, el compilador sí lo conoce en toda la función. Dentro del bloque solo le asignamos la dirección del objeto nuevo con `new`. El objeto vive en el heap así que no se destruye al salir del bloque, y podemos seguir usándolo afuera sin problema.

---

## Tercera parte (código final)

**1. ¿Por qué `pBloque` se destruye y `pBloque2` no?**

`pBloque` se destruye porque es un objeto directo en el stack, y los objetos del stack mueren al salir de su bloque. `pBloque2` en cambio **no es un objeto, es un puntero**, o sea una referencia a un objeto. El objeto de verdad está en el heap, y el heap no le hace caso a los bloques, solo se libera cuando llamamos `delete`.

**2. ¿Dónde se almacena `pBloque2`?**

El puntero `pBloque2` en sí está en el **stack**, porque fue declarado directamente en el main.

**3. ¿Dónde se almacena el objeto al que apunta `pBloque2`?**

El objeto con x = 500 e y = 600 está en el **heap**, porque fue creado con `new`.