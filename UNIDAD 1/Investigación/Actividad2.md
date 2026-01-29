Bitácora Unidad 1
Actividad 2: Ciclo fetch-decode-execute


¿Qué sucede?
R/
@1 // Carga el valor 1 en el registro 
A D=A // Guarda el valor de A (que es 1) en el registro 
D // Ahora D = 1 
@2 // Carga el valor 2 en el registro 
A D=D+A // Suma D + A y guarda el resultado en D // Ahora D = 1 + 2 = 3 
@16 // Carga la dirección 16 en el registro A 
M=D // Guarda el valor de D en la memoria RAM[16] // Ahora RAM[16] = 3 
(END) // Etiqueta/símbolo que marca una posición en el programa 
@END // Carga la dirección de la etiqueta END en A
0;JMP // Salto incondicional (jump) a la dirección en A // Esto crea un bucle infinito

¿Qué valor se almacena en la dirección de memoria 16?
R/ 3

¿Por qué crees que es ese valor?
R/ Porque el programa guardó el número 3 en la D, se dirigió a la casilla 16 (@16) y reemplaza su valor por ese número (M=D).

¿Qué instrucciones se ejecutan en cada ciclo Fetch-Decode-Execute?
R/
Ciclo 1:
Fetch: Lee la instrucción en PC  = 0 → @1
Decode: Es una instrucción A
Execute: Carga 1 en el registro A. PC = 1
Ciclo 2:
Fetch: Lee la instrucción en PC = 1 → D=A
Decode: Es una instrucción C (C-instruction)
Execute: D = A (D recibe el valor 1). PC = 2
Ciclo 3:
Fetch: Lee la instrucción en PC = 2 → @2
Decode: Es una instrucción A
Execute: Carga 2 en el registro A. PC = 3
Ciclo 4:
Fetch: Lee la instrucción en PC = 3 → D=D+A
Decode: Es una instrucción C
Execute: D = D + A (D = 1 + 2 = 3). PC = 4
Ciclo 5:
Fetch: Lee la instrucción en PC = 4 → @16
Decode: Es una instrucción A
Execute: Carga 16 en el registro A. PC = 5
Ciclo 6:
Fetch: Lee la instrucción en PC = 5 → M=D
Decode: Es una instrucción C
Execute: RAM[16] = D (guarda 3 en RAM[16]). PC = 6
Ciclo 7:
Fetch: Lee la instrucción en PC = 6 → (END) que se traduce a @6
Decode: Es una instrucción A
Execute: Carga 6 en el registro A. PC = 7
Ciclo 8:
Fetch: Lee la instrucción en PC = 7 → 0;JMP
Decode: Es una instrucción C con salto incondicional
Execute: PC = A (PC = 6, salta a la dirección 6)
Ciclo 9 en adelante:
Se repiten los ciclos 7 y 8 infinitamente (bucle)


¿Qué cambios observas en el contenido de la memoria y los registros?
R/
Elemento:A
Inicial:0
Final:6
Cambios:5

Elemento:D
Inicial:0
Final:3
Cambios: 2

Elemento:PC
Inicial:0
Final:6 y 7 bucle
Cambios: infinito

Elemento:RAM[16]
Inicial:0
Final:3
Cambios: 1

