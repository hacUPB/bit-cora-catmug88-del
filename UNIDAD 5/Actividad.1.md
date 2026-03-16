# Actividad 1
Diagnóstico programación orientada a objetos:

1. ¿Qué es el encapsulamiento para ti? Describe una situación en la que te haya sido útil o donde hayas visto su importancia.

r/ El encapsulamiento es el guardar detalles de un objeto y ocultarlos para que solo sean accesibles y/o modificables desde métodos específicos. Un ejemplo de cuando usé encapsulamiento fue en clase de pdoo, donde tuvimos que crear el programa de gestión de un restaurante, en el cual una de sus funciones era generarFactura(Cuenta)

Los datos de la clase Cuenta, solo podían modificarse desde este mismo, o con las funciones agregarPlato() eliminarPlato(), los cuales modificaban el valor total que debía pagar el cliente.

2. ¿Qué es la herencia? ¿Por qué un programador decidiría usarla? Da un ejemplo simple.

r/ La herencia es cuando una clase permite crear una clase "hija" o subclase, la cual hereda los atributos y métodos de la principal. Además puede tener nuevos atributos y métodos nuevos, o modificar los ya existentes. 

Como programadora, yo usaría la herencia para poder reutilizar código, mantenerlo más organizado y facilitar su mantenimiento. Un ejemplo de esto sería si hago un programa para un veterinario y tengo la clase Animal, la cual tiene el atributo int edad y el método comer() y creo la subclase Perro, la cual hereda esos atributos pero además le agrego Ladrar().

3. ¿Qué es el polimorfismo? Describe con tus palabras qué significa que un código sea “polimórfico”.

r/ Es lo que permite que un método pueda ser implementado por varios objetos, pero cada uno tiene su propia manera de implementarlo según su definición del mismo. 