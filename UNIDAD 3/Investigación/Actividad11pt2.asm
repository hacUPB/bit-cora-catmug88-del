#include <iostream>
using namespace std;

class Enemigo {
public:
    static int totalEnemigos;
    int vida;
    int* armas;

    Enemigo(int v) : vida(v) {
        totalEnemigos++;
        armas = new int[3];
        armas[0] = 10;
        armas[1] = 15;
        armas[2] = 20;
    }

    // Destructor agregado para liberar la memoria del arreglo
    ~Enemigo() {
        delete[] armas;
        totalEnemigos--;
    }
};

int Enemigo::totalEnemigos = 0;
