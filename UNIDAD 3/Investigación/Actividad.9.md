# Actividad 9: Miembros Estáticos e Instancia

**1. Conclusión sobre miembros estáticos y de instancia**

Los miembros de instancia como `valor` son propios de cada objeto. Cada Contador tiene su propio `valor` guardado en su propio espacio de memoria. Si cambio el `valor` de c1, el de c2 no se afecta para nada.

El miembro estático `total` es completamente diferente, existe una sola copia para toda la clase y todos los objetos la comparten. No importa si lo accedo como `c1.total` o `c2.total` o `Contador::total`, todos están mirando exactamente el mismo lugar en memoria. Eso lo pude confirmar con el depurador, `total` no aparece dentro de c1 ni dentro de c2, vive en otro lugar separado.

Como ventaja, los miembros estáticos son muy útiles cuando necesito guardar algo que pertenece a la clase entera y no a un objeto específico, como contar cuántos objetos se han creado. Como desventaja, hay que tener cuidado porque si algo lo modifica, afecta a todos, lo que puede causar bugs difíciles de encontrar.

**2. ¿En qué segmento de memoria está cada cosa?**

`c1` y `c2` están en el **stack**, porque los declaramos directamente dentro del main sin usar `new`.

`c3` es un puntero, y el puntero en sí (la variable que guarda la dirección) está en el **stack**. Pero el objeto al que apunta, el Contador con valor 15, ese sí está en el **heap** porque fue creado con `new`.

`Contador::total` está en el segmento de **datos estáticos** (data segment), que es una zona de memoria separada tanto del stack como del heap, reservada para variables globales y estáticas que existen durante toda la vida del programa.