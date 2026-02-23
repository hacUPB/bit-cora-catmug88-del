# Actividad 2 

## Implementación de la  funcion `swap`

```cpp
#include <iostream>
using namespace std;

void swapPorValor(int a, int b) {
    int temp = a;
    a = b;
    b = temp;
}

void swapPorReferencia(int &a, int &b) {
    int temp = a;
    a = b;
    b = temp;
}

void swapPorPuntero(int *a, int *b) {
    int temp = *a;
    *a = *b;
    *b = temp;
}

int main() {
    int x = 5;
    int y = 10;

    cout << "Valores iniciales:" << endl;
    cout << "x = " << x << ", y = " << y << endl;
    
    cout << "\nLlamando a swapPorValor(x, y)..." << endl;
    swapPorValor(x, y);
    cout << "Despues de swapPorValor: x = " << x << ", y = " << y << endl;

    cout << "\nLlamando a swapPorReferencia(x, y)..." << endl;
    swapPorReferencia(x, y);
    cout << "Despues de swapPorReferencia: x = " << x << ", y = " << y << endl;

    swapPorReferencia(x, y);

    cout << "\nLlamando a swapPorPuntero(&x, &y)..." << endl;
    swapPorPuntero(&x, &y);
    cout << "Despues de swapPorPuntero: x = " << x << ", y = " << y << endl;

    return 0;
}

```

## Resultados de las pruebas en main()

Con valores iniciales x = 5 y y = 10, al llamar a swapPorValor(x, y) no ocurre ningún cambio y las variables permanecen iguales, ya que la función trabaja con copias. En cambio, al ejecutar swapPorReferencia(x, y) los valores sí se intercambian, quedando x = 10 y y = 5, porque la función opera directamente sobre las variables originales mediante referencias. De igual forma, al usar swapPorPuntero(&x, &y) los valores también se intercambian, ya que se modifican directamente las direcciones de memoria de las variables.
