Actividad 3: Explorando la arquitectura del computador Hack

Identifica una instrucción que use la ALU y explica qué hace.
R/ La ALU (Arithmetic Logic Unit) es la encargada de realizar operaciones aritméticas como la resta, en este programa se usa la ALU en D=D-A
Como funciona? el computador recibe dos entradas A y Dy el ALU computa el resultado.

¿Para qué sirve el registro PC?
R/ PC (Program Counter) cuenta los pasos que realiza el programa e indica aque pasos leer de la ROM, sirve para saber que instruccion seguir, puede ser secuencial o hacer saltos (0;JMP) y asi se pueden hacer condicionales, bucles y funciones.

¿Cuál es la diferencia entre @i y @READKEYBOARD? (ayudada por ia)
R/ @i es una variable que apunta a una posición en la RAM donde se almacena un dato, mientras @READKEYBOARD es una etiqueta que marca una posición en el código (ROM) donde está una instrucción.

Describe qué se necesita para leer el teclado y mostrar información en la pantalla.
R/ Pra leer el teclado primero debe leer en la RAM la direccion de @kbd, detectar si hay una tecla presionada con una condicional y despues para diferenciar las teclas, usar un codigo ACSII como enter=128 y a=97. Ahora, para mostrar en pantalla 