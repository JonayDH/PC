#include <iostream>
#include <vector>

int main() {

  int numero{};
  std::vector<int> binario{};

  std::cout << "Introduce un número: ";
  std::cin >> numero;

  while (numero >= 2) {

    binario.push_back(numero % 2);
    numero /= 2;
  }

  binario.push_back(numero);

  std::cout << "El número en binario es: ";

  for (int i{static_cast<int>(binario.size()) - 1} ; i >= 0; i--) {

    std::cout << binario[i];
  }

  std::cout << std::endl;
  return 0;
}