// Programa para convertir de grados Fahrenheit a Celsius
// Usa la fórmula C = (F - 32)/1.8

#include <iostream>
#include <iomanip>

int main() {
  std::cout << std::fixed << std::setprecision(8);  // Ignorar

  std::cout << "Introduzca grados Fahrenheit (entero): ";
  int F;
  std::cin >> F;
  
  float C = (F - 32) / 1.8;
  
  std::cout << "Temperatura en grados Celsius: " << C;
  
  std::cout << "\nTermina el programa\n";
}


