# Actividad 1
## Parte 1: Diagnóstico programación orientada a objetos:

1. ¿Qué es el encapsulamiento para ti? Describe una situación en la que te haya sido útil o donde hayas visto su importancia.

r/ El encapsulamiento es el guardar detalles de un objeto y ocultarlos para que solo sean accesibles y/o modificables desde métodos específicos. Un ejemplo de cuando usé encapsulamiento fue en clase de pdoo, donde tuvimos que crear el programa de gestión de un restaurante, en el cual una de sus funciones era generarFactura(Cuenta)

Los datos de la clase Cuenta, solo podían modificarse desde este mismo, o con las funciones agregarPlato() eliminarPlato(), los cuales modificaban el valor total que debía pagar el cliente.

2. ¿Qué es la herencia? ¿Por qué un programador decidiría usarla? Da un ejemplo simple.

r/ La herencia es cuando una clase permite crear una clase "hija" o subclase, la cual hereda los atributos y métodos de la principal. Además puede tener nuevos atributos y métodos nuevos, o modificar los ya existentes. 

Como programadora, yo usaría la herencia para poder reutilizar código, mantenerlo más organizado y facilitar su mantenimiento. Un ejemplo de esto sería si hago un programa para un veterinario y tengo la clase Animal, la cual tiene el atributo int edad y el método comer() y creo la subclase Perro, la cual hereda esos atributos pero además le agrego Ladrar().

3. ¿Qué es el polimorfismo? Describe con tus palabras qué significa que un código sea “polimórfico”.

r/ Es lo que permite que un método pueda ser implementado por varios objetos, pero cada uno tiene su propia manera de implementarlo según su definición del mismo. 

## Parte 2: Analisis del código en c#

**Encapsulamiento:**

- Señala una línea de código que sea un ejemplo claro de encapsulamiento y explica por qué lo es.

- ¿Por qué crees que el campo nombre es private pero la propiedad Nombre es public? ¿Qué problema se evita con esto?

r/ Una línea de código que implementa encapsulamiento es 

``` c#
public abstract class Figura
{    
	private string nombre;
    public string Nombre 
    {        get { return nombre;}
		    protected set { nombre = value; }
    }
```
Específicamente private string nombre; en el cual se declara una variable privada de tipo string, lo que significa que no se puede acceder a ella desde ninguna otra clase. En cambio esta la variable Nombre, la cual si es pública por lo que da acceso al dato. Esto es importante porque evita que se cambie el nombre de la figura sin querer o que le asignen valores inválidos.

**Herencia:**

- ¿Cómo se evidencia la herencia en la clase Circulo?
- Un objeto de tipo Circulo, además de Radio, ¿Qué otros datos almacena en su interior gracias a la herencia?

r/ Se puede evidenciar la herencia en Círculo en la línea 

```c#
public class Circulo : Figura
```
Los dos puntos ":" significa que circulo hereda de figura, es decir automaticamente tiene los mismos atributos y metodos, en este caso el atributo nombre y el metodo dibujar() aunque lo sobreescribe para sus propias necesidades. Además del Radio también almacena el Nombre

**Polimorfismo**

- Observa el bucle foreach. La variable fig es de tipo Figura, pero a veces contiene un Circulo y otras un Rectangulo. Cuando se llama a fig.Dibujar(), el programa ejecuta la versión correcta. En tu opinión, ¿Cómo crees que funciona esto “por debajo”? No necesitas saber la respuesta correcta, solo quiero que intentes razonar cómo podría ser.

r/ creo que internamente lo que esta pasando es que el programa implementa la funcion correspondiente a cada tipo de figura, ya que el metodo varia dependiendo de la figura, y por eso primero identifica que tipo de figura es para saber que metodo ejecutar.

## Parte 3: hipótesis sobre la implementación

Esta es la parte más importante. Imagina que eres un diseñador de lenguajes de programación. Tienes que decidir cómo implementar estos conceptos en la memoria y en el procesador. No hay respuestas incorrectas, solo ideas. Dibuja si te ayuda.

1. Memoria y herencia: cuando creas un objeto Rectangulo, este tiene Base, Altura y también Nombre. ¿Cómo te imaginas que se organizan esos tres datos en la memoria del computador para formar un solo objeto?
2. El mecanismo del polimorfismo: pensemos de nuevo en la llamada fig.Dibujar(). El compilador solo sabe que fig es una Figura. ¿Cómo decide el programa, mientras se está ejecutando, si debe llamar al Dibujar del Circulo o al del Rectangulo? Lanza algunas ideas o hipótesis.
3. La barrera del encapsulamiento: ¿Cómo crees que el compilador logra que no puedas acceder a un miembro private desde fuera de la clase? ¿Es algo que se revisa cuando escribes el código, o es una protección que existe mientras el programa se ejecuta? ¿Por qué piensas eso?

r1/ Al crear el rectángulo, este contiene nombre, base y altura, el nombre lo hereda de la clase figura, es como si se copiara la info de su clase superior y despues se agrega sus datos nuevos (base y altura) como si la clase figura tuviera una extension llamada rectangulo.

r2/ Mi hipótesis de como funciona esto es que cada objeto tiene una lista de instrucciones a seguir dependiendo del tipo de figura, y el programa al ejecutar fig.Dibujar() primero analiza qué figura esta tratando y dependiendo de esto realiza la instruccion pertinente.

r3/ Creo que el compilador lee el codigo y si al inicializar un dato, metodo con "private", este toma nota de que esta "con seguro" y solo una clase tiene la llave, el dato sigue existiendo pero para evitar fallas en la lógica del programa el codigo tiene esta regla.Como una medida de seguridad, mas que una barrera física.



