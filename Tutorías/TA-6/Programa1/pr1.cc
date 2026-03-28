#include <iostream>

// calcula el inverso de un número entero
double inverso(int n) {
    return 1.0 / n;
}


void inverso_de_rango(int x, int y) {

    for (int i = x; i <= y; i++) {
        double inv = inverso(i);
        std::cout << "\n1 / " << i << " = " << inv;
    }
}

int main() {
    int a, b;
    do {
        std::cout << "Ingrese el rango (a b), con a <= b: \n";
        std::cin >> a >> b;
    } while (a > b);

    inverso_de_rango(a, b);
    std::cout << "\nFIN DEL PROGRAMA.\n";
    return 0;
}