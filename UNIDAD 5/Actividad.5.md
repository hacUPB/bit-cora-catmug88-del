# Actividad 5

**Concepto de herencia:** en ofApp.h la clase CircularExplosion hereda de la clase ExplotionParticle que a su vez hereda de Particle.

{captura en la memoria el objeto explosion particle}
1.  Comparar jerarquia de clases con los campos en memoria del objeto ¿Qué puedes observar? ¿Qué información te proporciona el depurador? ¿Qué puedes concluir?

r/ Están organizados desde el padre hasta el mas hijo, es decir como en "nivel descendente" de ancestros, primero esta Particle, después ExplotionParticle y por último CircularExplotion. Supongo que es para que al momento de referenciarlo sepa quién es hijo de quién teniendo en cuenta la dirección ya que el hijo tiene la dirección del padre en su dirección. Por esto es posible por ejemplo que el arreglo de punteros no se confunda al referenciar los objetos.

2. ¿Cómo funciona la herencia en c++?

r/ Funciona de forma muy directa: el objeto hijo contiene literalmente al padre dentro de él en memoria, no es una referencia ni un enlace aparte. Todo se guarda en un mismo bloque, primero los datos del padre y luego los del hijo. Además, el compilador se encarga de que cuando se llamen funciones, se use la versión correcta (la del hijo si fue modificada, o la del padre si no). Y cuando haces un cast a la clase padre, no se mueve nada en memoria, simplemente se interpreta ese mismo espacio como si fuera un objeto del tipo padre.

3. C++ permite hacer algo que C# no: herencia múltiple. Realiza un experimento que te permita ver cómo se objeto en memoria cuya clase base tiene herencia múltiple.

r/ Para explicar como teniendo en cuenta el programa, las clases circularexplotion y starexplotion ambas son hijas de la misma clase,con la inspeccion del objeto en el depurador: 

El objeto en memoria no es una sola cosa continua como en herencia simple, sino que contiene dos “bloques” de sus padres, uno después del otro, y luego sus propios datos. Cada clase base tiene su propio espacio dentro del objeto. 

Además, si convierto el objeto a cada tipo base, verás que los punteros no apuntan exactamente al mismo lugar, porque cada padre está en una posición distinta dentro de la memoria. Esto demuestra que en C++ la herencia múltiple se implementa guardando cada clase base directamente dentro del objeto final.
