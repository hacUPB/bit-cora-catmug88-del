**Actividad 1: Dibujando un punto en la pantalla**

Hice un programa en lenguaje ensamblador para la computadora hack con ayuda del profesor, que marcara un pixel negro en la esquina superior izquierda.

Como experimento, debo traducir el código a un lenguaje de alto nivel, en este caso c++.

1. Entender como funciona el programa ensamblador:

@16384 --> carga un valor en el registro
16384 que es el primer registro de la pantalla

M=1--> carga el valor 1 en ese registro, (1=negro, 0=blanco) el cual marca solo el primer pixel de los 16 que tiene cada uno.

2. Escribo lo mismo pero en c++:

int* screen = (int*)(16384); --> creo una variable puntero tipo int (numero entero) que guarda la dirección del primer registro pantalla del hack
*screen = 1 --> uso el puntero para guardar el valor en decimal en el registro.