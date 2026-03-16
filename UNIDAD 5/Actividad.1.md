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

```