# Actividad 6

**Concepto de polimosrfismo:** el método update de la clase Particle es un metodo virtual, analiza com funciona el metodo update en esta parte del codigo:

``` cpp
    // Actualiza todas las partículas    
    for (int i = 0; i < particles.size(); i++) {        
		    particles[i]->update(dt);    
		    }

``` 

Tienes un vector de Particle*, pero en realidad cada posición apunta a objetos diferentes (unos son RisingParticle, otros CircularExplosion, etc.). El vector no sabe eso, solo ve punteros a Particle. Entonces, cuando el programa llama update, no puede decidir antes cuál función usar, porque eso depende del tipo real del objeto en ese momento. Lo que hace es ir al objeto en memoria, mirar una referencia interna (la vtable) y desde ahí encontrar cuál es la función correcta que debe ejecutar. Cada tipo de objeto tiene su propia tabla con sus funciones, por eso el mismo código puede comportarse diferente según el objeto. Básicamente, eso es el polimorfismo: decidir qué función ejecutar en tiempo de ejecución en lugar de dejarlo fijo desde el inicio.