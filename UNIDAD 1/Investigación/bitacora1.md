🧪✍️ Experimento
Ahora es tu turno. Crea un archivo llamado program.asm y copia el código del programa anterior. Ejecuta el programa en el simulador de la CPU Hack y observa cómo se comporta. ¿Qué sucede? ¿Qué valor se almacena en la dirección de memoria 16? ¿Por qué crees que es ese valor? ¿Qué instrucciones se ejecutan en cada ciclo Fetch-Decode-Execute? ¿Qué cambios observas en el contenido de la memoria y los registros? ¿Qué instrucciones se ejecutan en cada ciclo Fetch-Decode-Execute?

1. ¿Qué sucede?R/ La CPU cumple dos tipos de funciones, A y C las cuales se refieren a Adress y Compute. En este programa la cpu realiza las instrucciones de esta manera:

            @1 --> A: a se dirige a 1
			D=A --> C: el dato guardado en D cambia a 1 que es la direccionn a la que se dirigio antes
			@2 --> a se dirige a 2
			D=D+A --> el dato guardado en D toma el mismo 1, y se le suma 2 que fue la ultma direccion, es decir 3
			@16 --> se dirige a la ubicación número dieciseis de la RAM
			M=D --> se iguala 
(END)
			@END
			0;JMP