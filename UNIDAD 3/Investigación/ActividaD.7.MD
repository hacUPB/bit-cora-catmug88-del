# Actividad 7: Objetos en el Heap

## Reflexiones
1. Diferencia entre objetos en el stack y en el heap
La diferencia más grande es quién se encarga de la memoria. Cuando creamos pStack, el programa solito sabe cuándo crearlo y cuándo borrarlo, no tenemos que hacer nada. Pero cuando usamos new para crear pHeap, nosotros somos los responsables de liberarlo con delete, si no lo hacemos la memoria queda ocupada para siempre mientras el programa corra (a eso le llaman "memory leak").
También noté con el depurador que las direcciones de memoria son completamente diferentes, están en zonas distintas de la RAM. El stack tenía una dirección más "alta" y el heap una más "baja" (o al revés dependiendo del sistema), lo importante es que son regiones separadas.
2. ¿pStack es un objeto o una referencia?
pStack es el objeto directamente. No hay intermediario, los valores x = 30 e y = 40 viven literalmente dentro de esa variable. Si inspecciono la dirección de pStack en el depurador, ahí mismo están los bytes de los datos.
3. ¿pHeap es un objeto o una referencia?
pHeap es una referencia (un puntero). La variable pHeap no guarda el objeto, guarda la dirección de donde está el objeto. El objeto de verdad con x = 50 e y = 60 está en algún lugar del heap, y pHeap solo sabe llegar hasta allá.
4. ¿Qué observé en Memory1 con &pHeap?
Cuando escribí &pHeap en Memory1, vi que el contenido de esa dirección no eran los valores 50 y 60. En cambio, vi una dirección de memoria guardada ahí, y esa dirección era exactamente el mismo valor que aparecía en la pestaña Locals para pHeap.
Lo que esto significa es que pHeap es simplemente una cajita que guarda una dirección. Esa dirección apunta a otro lugar en memoria donde sí están los datos reales del objeto. O sea, estoy viendo la "flechita" en sí, no el objeto al que apunta.