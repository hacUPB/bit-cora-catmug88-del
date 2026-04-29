Parte 1: Recuperación de conocimiento
1. Stack y Heap
El stack es una zona de memoria que se maneja sola, automáticamente. Cuando declaro una variable o un objeto normal dentro de una función, va al stack, y cuando esa función o bloque termina, la memoria se libera sola sin que yo haga nada. Es rápido pero tiene espacio limitado.
El heap es una zona de memoria más grande donde la memoria NO se libera sola. Yo soy el responsable de pedirla con new y devolverla con delete. Si olvido el delete, esa memoria queda ocupada para siempre mientras el programa corre.
2. Las tres formas de pasar parámetros
Pasar por valor hace una copia completa del objeto o variable. La función trabaja con esa copia y cualquier cambio no afecta al original. Lo usaría cuando quiero proteger el original o cuando el dato es pequeño como un int o un char.
Pasar por referencia no copia nada, la función trabaja directamente con el original usando el símbolo &. Lo usaría cuando quiero modificar el original o cuando el objeto es grande y no quiero el costo de copiarlo.
Pasar por puntero le mando a la función la dirección de memoria del objeto. La función puede modificar el original accediendo a través de esa dirección con ->. Es parecido a la referencia pero la sintaxis es diferente. Lo usaría cuando necesito poder pasar nullptr o cuando trabajo con memoria dinámica.
3. Variable local, global y local estática
Una variable local nace cuando el programa entra a la función y muere cuando sale. Vive en el stack.
Una variable global existe durante toda la vida del programa, desde antes del main hasta que el programa termina. Vive en el segmento de datos.
Una variable local estática es curiosa: está declarada dentro de una función pero no muere cuando la función termina, conserva su valor entre llamadas. También vive en el segmento de datos, igual que las globales.
4. Un objeto en C++ desde la perspectiva de memoria
Un objeto en C++ es básicamente un bloque de bytes en memoria que contiene todos sus miembros de instancia juntos y seguidos. Los miembros de instancia como x e y viven dentro del objeto, en el stack si el objeto fue creado normal, o en el heap si fue creado con new.
Los miembros estáticos son diferentes, no viven dentro del objeto sino en el segmento de datos, y existe una sola copia compartida entre todos los objetos de esa clase.

Parte 2: Transferencia y análisis
1. Problemas en el código
El primer problema es que la clase Enemigo crea un arreglo dinámico con new int[3] en el constructor pero nunca lo libera con delete[]. Como los objetos soldado se crean en el stack dentro del for, cuando salen del bloque el destructor no existe (no hay destructor definido), entonces el arreglo armas en el heap queda abandonado. Eso es un memory leak, y se repite 10 veces porque se crean 10 soldados en total.
El segundo problema es que no hay destructor definido. Cada vez que un soldado muere al salir del for, nadie libera el new int[3] que ese soldado había pedido. La memoria se va acumulando sin liberarse.
2. ¿Qué valor tendrá totalEnemigos?
Mostrará 10. Cada llamada a crearEscuadron crea 5 enemigos en el for, y cada constructor incrementa totalEnemigos. Como totalEnemigos es estático, comparte su valor entre todos los objetos y entre todas las llamadas. Dos llamadas a crearEscuadron = 10 enemigos creados en total.

Parte 3: Reflexión metacognitiva
1. El concepto más crítico
Para mí el más crítico es entender el ciclo de vida de los objetos y cuándo liberar memoria del heap. Es fácil crear cosas con new y olvidarse del delete, y eso causa memory leaks que pueden tumbar un programa entero o hacerlo lentísimo con el tiempo. Los otros conceptos son importantes pero este error es silencioso, el programa compila y corre, pero por dentro se está rompiendo.
2. Cómo cambió mi visión sobre los objetos
Antes pensaba que un objeto era solo una cosa abstracta con datos y métodos. Después de comparar C++ con C#, entendí que en C++ un objeto es literalmente bytes en memoria y yo controlo exactamente dónde vive. En C# el objeto siempre va al heap y yo solo tengo una referencia, nunca el objeto directo. Esto importa en la práctica porque en C++ puedo hacer programas más eficientes pero también puedo cometer errores de memoria que en C# simplemente no existen porque el garbage collector limpia solo.
3. Por qué importa entender la gestión de memoria
Entender la memoria es la diferencia entre un programa que funciona y uno que falla misteriosamente. Si no sabes dónde viven tus datos, no puedes entender por qué tu programa crashea o se vuelve lento. Y en áreas como videojuegos o sistemas embebidos, un mal manejo de memoria puede arruinar toda la experiencia del usuario o incluso hacer fallar hardware real.