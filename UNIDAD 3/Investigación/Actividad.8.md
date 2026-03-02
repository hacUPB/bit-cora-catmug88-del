# Actividad 8: Funciones y Objetos en C++

1. ¿Por qué aparece el destructor de "cambiado" después de llamar cambiarNombre?
Lo que pasa es que cuando llamamos cambiarNombre(original, "cambiado"), C++ no le pasa el objeto original a la función, sino que hace una copia completa de él. Esa copia es la que vive dentro de la función como p. Entonces cuando le cambiamos el nombre a p, solo le estamos cambiando el nombre a la copia, no al original.
Cuando la función termina, esa copia ya no sirve y C++ la destruye automáticamente. Por eso vemos el mensaje del destructor con "cambiado", porque era la copia la que tenía ese nombre. El original nunca se enteró de nada.
2. ¿Por qué original sigue existiendo?
Porque original fue creado en el stack del main, y el main todavía no ha terminado. La función cambiarNombre tiene su propio espacio en memoria y cuando termina solo destruye lo que ella misma creó (la copia). El original del main sigue ahí tranquilo.
3. ¿Están en el mismo lugar de memoria original y p?
No, con el depurador se puede ver claramente que tienen direcciones de memoria diferentes. original está en el stack del main y p está en el stack de la función cambiarNombre. Son dos objetos distintos en dos lugares distintos, solo que p nació como copia de original.

Con Punto& p (por referencia):
4. ¿Qué ocurre ahora?
Ahora sí funciona el cambio. Cuando ejecutamos el programa, original.imprimir() después de llamar la función ya muestra el nombre "cambiado". Además ya no aparece ningún destructor extra, porque no se hizo ninguna copia. La & le dice a C++ "no copies el objeto, trabaja directamente con el original". Entonces p dentro de la función es el mismísimo original, no una copia.

Con Punto* p (por puntero):
5. ¿Qué ocurre ahora?
El resultado es igual que con la referencia, el nombre de original sí cambia a "cambiado" y tampoco aparece destructor extra. La diferencia es cómo se hace: le pasamos &original que es la dirección de memoria del objeto, y dentro de la función usamos p->name para llegar a los datos a través de esa dirección. El efecto final es el mismo, se modifica el objeto original.
6. Diferencia entre pasar por valor, por referencia y por puntero
Pasar por valor hace una copia completa del objeto. La función trabaja con esa copia y cualquier cambio se pierde cuando la función termina. Además tiene el costo de crear y destruir esa copia.
Pasar por referencia no copia nada, la función trabaja directamente con el objeto original. Es como darle a la función acceso directo al objeto con el mismo nombre de siempre.
Pasar por puntero tampoco copia el objeto, pero en vez de trabajar con el objeto directamente, le pasamos su dirección de memoria. La función tiene que usar -> para acceder a sus datos a través de esa dirección. El resultado es muy similar a la referencia pero la sintaxis es diferente.