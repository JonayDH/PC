# /* 
#  * File:   repasotablas.cpp
#  * Authores: Carlos y Alberto
#  *
#  * Descripción: El usuario introducira por teclado la tabla de multiplicar que
#  * quiere repasar. Si introduce un 0 el programa finalizara. Si introduce un
#  * numero mayor que 0 debera pregutar al usuario por todas las multiplicaciones
#  * del numero introducido por lo numero del 1 al 10. Al final de cada tabla se
#  * visualizara el porcentaje de aciertos.
#  */
# #include <iostream>

# int main(int argc, char** argv) {

#   std::cout << "Programa para repasar las tablas de multiplicar.\n";
#   int n; // numero del que quiero repasar la tabla
#   do {
#     std::cout<<"¿Qué tabla deseas repasar? Introduce un número (0 para salir): ";
#     std::cin >> n;
#     if (n == 0) break; // si introduce un 0 sale del bucle
#     int aciertos = 0; // incializamos el numero de aciertos
#     for (int i = 1; i <= 10; i++) {
#       std::cout << i << " x " << n << " ? ";
#       int resultado;
#       std::cin >> resultado;
#       if (resultado == (i * n)) {
#         aciertos++;
#       }
#     }
#     int porcentaje = aciertos * 10;
#     std::cout << "Tu porcenaje de aciertos es del " << porcentaje << "%\n";
#   } while (n != 0);
#   std::cout << "Termina el programa.\n";
# }

    .data

titulo:     .asciiz "Programa para repasar las tablas de multiplicar.\n"
cad1:       .asciiz "¿Qué tabla deseas repasar? Introduce un número (0 para salir): "
cad2:       .asciiz " x "
cad3:       .asciiz " ? "
cad4:       .asciiz "Tu porcenaje de aciertos es del "
cad5:       .asciiz "%\n"
cad6:       .asciiz "Termina el programa.\n"

    .text

main:

    # TABLA DE REGISTROS
    # n         $s0
    # aciertos  $s1
    # i         $s2
    # resultado $s3

#   std::cout << "Programa para repasar las tablas de multiplicar.\n";

    li $v0,4
    la $a0,titulo
    syscall

#   int n; // numero del que quiero repasar la tabla
#   do {
    do_1:
#     std::cout<<"¿Qué tabla deseas repasar? Introduce un número (0 para salir): ";

        li $v0,4
        la $a0,cad1
        syscall
        
#     std::cin >> n;

        li $v0,5
        syscall
        move $s0,$v0

#     if (n == 0) break; // si introduce un 0 sale del bucle

        beqz $s0,fin_dowhile

#     int aciertos = 0; // incializamos el numero de aciertos

        li $s1,0

#     for (int i = 1; i <= 10; i++) {

        li $s2,1
        for:

            bgt $s2,10,fin_for

#       std::cout << i << " x " << n << " ? ";

            li $v0,1
            move $a0,$s2
            syscall

            li $v0,5
            la $a0,cad2
            syscall

            li $v0,1
            move $a0,$s0
            syscall

            li $v0,5
            la $a0,cad3
            syscall

#       int resultado;
#       std::cin >> resultado;

            li $v0,5
            syscall
            move $s3,$v0

#       if (resultado == (i * n)) {
#         aciertos++;
#       }

            mul $t0,$s2,$s0
            bne $s3,$t0,fin_if
            addi $s1,1

            fin_if:
#     }

            addi $s2,1
            b for

        fin_for:

#     int porcentaje = aciertos * 10;

        mul $s1,$s1,10

#     std::cout << "Tu porcenaje de aciertos es del " << porcentaje << "%\n";

        li $v0,4
        la $a0,cad4
        syscall

        li $v0,5
        move $a0,$s1
        syscall

        li $v0,4
        la $a0,cad5
        syscall

#   } while (n != 0);

    bnez $s0,do_1

    fin_dowhile:

#   std::cout << "Termina el programa.\n";

    li $v0,4
    la $a0,cad6
    syscall
# }    

    #exit
    li $v0,10
    syscall
