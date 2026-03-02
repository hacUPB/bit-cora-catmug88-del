# Actividad 6: Hola Objeto: creación de un objeto en el stack

Actividad 6: Hola Objeto
Calculadora: 0A y 14 en hexadecimal
Cuando escribí 0A en la calculadora en modo hexadecimal y cambié a decimal, me dio 10.
Cuando escribí 14, me dio 20.
La vedrad teien sentido porque le pase x = 10 e y = 20 al constructor. O sea, en la memoria están guardados exactamente esos números, pero en hexadecimal.


## Si la arquitectura fuera big-endian...
En little-endian los bytes se guardan así (para x = 10):
0A 00 00 00
Si fuera big-endian, el byte más importante va primero, entonces quedaría al revés:
00 00 00 0A
Y para y = 20 (0x14):
En vez de 14 00 00 00 quedaría 00 00 00 14

## Reflexiones
1. ¿Diferencia entre constructor y destructor?
El constructor es lo que se ejecuta cuando el objeto nace, o sea cuando escribimos Punto p(10, 20). Ahí es donde le damos los valores iniciales. El destructor es lo contrario, se ejecuta solito cuando el objeto ya no se necesita y se va a "morir". En el programa lo vimos porque al terminar el main, el programa imprimió el mensaje del destructor sin que nosotros hiciéramos nada.
2. ¿Diferencia entre objeto y clase?
La clase es como el molde o el plano. Punto es la clase, nos dice que un punto tiene x e y. El objeto es cuando ya usamos ese molde para crear algo real, en este caso p es el objeto, es un Punto de verdad con valores concretos (10 y 20).
3. ¿Qué diferencia noto entre Punto en C++ y C#?
El código se ve muy parecido, pero la diferencia grande está en cómo se crea el objeto. En C++ simplemente escribimos Punto p(10, 20) y ya. En C# tuvimos que escribir new y usar una referencia: Punto p = new Punto(10, 20). Eso ya nos da una pista de que algo diferente está pasando por detrás.
4. ¿Qué es p en C++ y qué es p en C#?
En C++, p es el objeto directamente. El objeto vive ahí mismo en esa variable.
En C#, p es una referencia, o sea es como una flechita que apunta hacia donde está el objeto de verdad. El objeto no está en p, está en otro lado y p solo sabe dónde encontrarlo.
5. ¿En qué parte de la memoria se guarda p?
En C++, p se guarda en el stack, porque lo declaramos dentro del main sin usar new. El stack es una zona de memoria que se maneja automáticamente.
En C#, la referencia p está en el stack, pero el objeto de verdad (los datos x e y) están en el heap, porque C# siempre crea los objetos de clases en el heap con new.
6. ¿Qué observé con el depurador? ¿Qué es un objeto en C++?
Con el depurador pude ver que p tenía directamente los valores x = 10 e y = 20 guardados en memoria. Y en la ventana Memory vi los bytes 0A 00 00 00 14 00 00 00 justo en la dirección de p.
Entonces un objeto en C++ es básicamente un bloque de memoria que contiene todos los datos de sus atributos guardados uno tras otro. No hay nada mágico, es literalmente bytes en memoria. En este caso 4 bytes para x y 4 bytes para y, total 8 bytes.

