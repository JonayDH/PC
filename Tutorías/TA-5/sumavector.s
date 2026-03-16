# #include <iostream>

# #define NumElem 11

# int main() {

# 	int vec[NumElem] = {3, 9, 5, 7, -4, 14, 8, -11, 2};

# 	int suma = 0;

# 	for (int i{}; i < NumElem; i++) {

# 		int val = vec[i];
# 		suma += val;
# 	}
# }

.data

	vec: 

		.word 3, 9, 5, 7, -4, 14, 8, -11, 2

	NumElem = 11
	tamW = 4

.text

main:

# Tabla de registros:
# 
# suma -> $s0
# val -> $t0
# i -> $s1

# int suma = 0;
	li $s0,0

# 	for (int i{}; i < NumElem; i++) {

# inicializamos i
	li $s1,0

# condición del for
	for_condicion:

		blt $s1,NumElem,for_dentro
		b for_fuera

	for_dentro:

# 		int val = vec[i];
# 		suma += val;

# cargamos la dirección inicial
		la $t1,vec

# Conseguimos la nueva dirección
		mul $t2,$s1,tamW
		add $t2,$t2,$t1

# La cargamos en $t0
		lw $t0,0($t2)

# La sumamos y volvemos a la condición del bucle
		add $s0,$s0,$t0
		addi $s1,1

		b for_condicion
# La mostramos por pantalla y acabamos el programa
	for_fuera:

		li $v0,1
		move $a0,$s0
		syscall

		li $v0,10
		syscall