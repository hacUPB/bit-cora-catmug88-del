Actividad 3: Explorando la arquitectura del computador Hack

Identifica una instrucción que use la ALU y explica qué hace.
R/ La ALU (Arithmetic Logic Unit) es la encargada de realizar operaciones aritméticas como la resta, en este programa se usa la ALU en D=D-A
Como funciona? el computador recibe dos entradas A y Dy el ALU computa el resultado.

¿Para qué sirve el registro PC?
R/ PC (Program Counter) cuenta los pasos que realiza el programa e indica aque pasos leer de la ROM, sirve para saber que instruccion seguir, puede ser secuencial o hacer saltos (0;JMP) y asi se pueden hacer condicionales, bucles y funciones.

¿Cuál es la diferencia entre @i y @READKEYBOARD?
R/ @i es una variable que apunta a una posición en la RAM donde se almacena un dato, mientras @READKEYBOARD es una etiqueta que marca una posición en el código (ROM) donde está una instrucción.

Describe qué se necesita para leer el teclado y mostrar información en la pantalla. (ayudada por ia)
R/ Pra leer el teclado primero debe leer en la RAM la direccion de @kbd, comparar con 0 detectando si hay una tecla presionada con una condicional y despues para diferenciar las teclas, usar un codigo ACSII como enter=128 y a=97. Ahora, para mostrar en pantalla (mapa de bits de 256×512 píxeles) se accede a las direcciones de la pantalla y escribe los valores para los pixeles negros o blancos.

### **Para leer el teclado:**
1. ✅ Acceder a `RAM[24576]`
2. ✅ Leer el valor con `D=M`
3. ✅ Comparar con 0 para detectar tecla
4. ✅ Comparar con ASCII para identificar tecla

### **Para escribir en pantalla:**
1. ✅ Acceder a rango `RAM[16384-24575]`
2. ✅ Calcular dirección: `16384 + (fila × 32) + (col ÷ 16)`
3. ✅ Escribir valor:
   - `M=-1` para píxeles negros
   - `M=0` para píxeles blancos
   - Valor específico para patrones
4. ✅ Actualizar múltiples posiciones para dibujos complejos

Identifica un bucle en el programa y explica su funcionamiento.
R/ Bucle para borrar(sin tecla)

@i
D=M 
@SCREEN
D=D-A
@READKEYBOARD
D;JLE   
@i
M=M-1 
A=M 
M=0
@READKEYBOARD
0;JMP

Retrocede el puntero i
Borra píxeles poniéndolos en blanco
Si llegó al inicio de la pantalla, no retrocede más
Regresa al inicio del bucle

Identifica una condición en el programa y explica su funcionamiento.
R/ condicion para saber si hay una tecla presionada:

@KBD
D=M
@KEYPRESSED
D;JNE

¿El usuario está presionando alguna tecla?
Si SÍ (teclado ≠ 0):

Pinta píxeles de negro
Avanza hacia adelante en la pantalla

Si NO (teclado = 0):

Borra píxeles (los pone en blanco)
Retrocede en la pantalla