# #include <iostream>

# // calcula el inverso de un número entero
# double inverso(int n) {
#     return 1.0 / n;
# }


# void inverso_de_rango(int x, int y) {

#     for (int i = x; i <= y; i++) {
#         double inv = inverso(i);
#         std::cout << "\n1 / " << i << " = " << inv;
#     }
# }

# int main() {
#     int a, b;
#     do {
#         std::cout << "Ingrese el rango (a b), con a <= b: \n";
#         std::cin >> a >> b;
#     } while (a > b);

#     inverso_de_rango(a, b);
#     std::cout << "\nFIN DEL PROGRAMA.\n";
#     return 0;
# }

.data

	cadena1: .asciiz "Ingrese el rango (a b), con a <= b: \n"
	cadena2: .asciiz "\n1 / "
	cadena3: .asciiz " = "
	cadena4: .asciiz "\nFIN DEL PROGRAMA.\n"

.text

# double inverso(int n) {
inverso:
# Función que calcula el inverso de un número
# Argumentos: n -> $a0
# Retorno: 1.0 / n -> $f12

#     return 1.0 / n;
	move $t0,$a0

	mtc1 $t0,$f4
	cvt.d.w $f4,$f4

	li.d $f6,1.0
	div.d $f0,$f6,$f4

	jr $ra
# }


# void inverso_de_rango(int x, int y) {
inverso_de_rango:
# Función que calcula el inverso en un rango
# Argumentos: 	x -> $a0
#		y -> $a1
# Retorno: nada

# Banco de registros:
# x -> $s0
# y -> $s1
# i -> $s2
# inv -> $f20

#     for (int i = x; i <= y; i++) {

	addi $sp,-12
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)

	move $s0,$a0
	move $s2,$s0
	move $s1,$a1

	for_condicion:

		ble $s2,$s1,for_dentro
		b for_fuera

	for_dentro:
#         double inv = inverso(i);
		addi $sp,-4
		sw $ra,0($sp)

		move $a0,$s2
		jal inverso

		lw $ra,0($sp)
		addi $sp,4

		mov.d $f20,$f0

#         std::cout << "\n1 / " << i << " = " << inv;
		li $v0,4
		la $a0,cadena2
		syscall

		li $v0,1
		move $a0,$s2
		syscall

		li $v0,4
		la $a0,cadena3
		syscall

		li $v0,3
		mov.d $f12,$f20
		syscall

		addi $s2,1
		b for_condicion

#     }
	for_fuera:

		lw $s0,0($sp)
		lw $s1,4($sp)
		lw $s2,8($sp)
		addi $sp,12

		jr $ra
# }

# int main() {
main:

# Banco de registros:
# a -> $s0
# b -> $s1

#     int a, b;

#     do {
	do:
#         std::cout << "Ingrese el rango (a b), con a <= b: \n";

		li $v0,4
		la $a0,cadena1
		syscall

#         std::cin >> a >> b;
		li $v0,5
		syscall
		move $s0,$v0

		li $v0,5
		syscall
		move $s1,$v0

	do_condicion:

#     } while (a > b);
		bgt $s0,$s1,do

	do_fuera:

#     inverso_de_rango(a, b);
	move $a0,$s0
	move $a1,$s1
	jal inverso_de_rango

#     std::cout << "\nFIN DEL PROGRAMA.\n";
	li $v0,4
	la $a0,cadena4
	syscall

#     return 0;
# }
	li $v0,10
	syscall
