**Actividad 6: Experimenta con arreglos**

Programa ensamblador que sume los numeros de un arreglo hasta su posicion 10.

**Predicción:** Para hacer el programa deben cumplirse los siguietes pasos
1. decidir en que espacio de la memoria guardar cada variable

arr empieza en RAM[100], 
sum = RAM[110], 
j =RAM[111]

2. Guardar datos
1 en RAM[100]
2 en RAM[101]
...

SUM= 0, J = 0

3. Crear el ciclo for con saltos

(LOOP)
JLT,JGE etc

4. Acceder al arreglo
tomar la direcion base del arreglo y sumarle j

direccion= 100 + j
valor = RAM[direccion]

5. Suma
cargar sum, sumarle el valor leido del arreglo, guardar el resultado en sum (paso a paso)

6. Terminal el ciclo
cuando j==10: salir

**Ejecutar:**

