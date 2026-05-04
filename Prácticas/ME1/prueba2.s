# #include <iostream>

# const int n1 = 6;
# double v1[n1] = {10.0, 8.0, 6.0, 4.0, 2.0, -1.0};

# const int n2 = 5;
# double v2[n2] = {9.0, 7.0, 6.0, 3.0, 1.0};


# // 🔹 FUNCIÓN CORTA
# // Devuelve la suma de los elementos positivos
# double suma_positivos(double* v, const int n) {
#     int i = 0;
#     double suma = 0.0;

#     while (i < n) {
#         if (v[i] > 0) {
#             suma = suma + v[i];
#         }
#         i++;
#     }

#     return suma;
# }


# // 🔹 FUNCIÓN MEDIA
# // Muestra los elementos de v1 cuya suma acumulada supera a la de v2
# void mayores_suma(double* v1, const int n1, double* v2, const int n2) {

#     double suma2 = suma_positivos(v2, n2);

#     int i = 0;
#     double suma1 = 0.0;

#     while (i < n1) {
#         suma1 = suma1 + v1[i];

#         if (suma1 > suma2) {
#             std::cout << v1[i] << " ";
#         }

#         i++;
#     }

#     std::cout << "\n";
# }


# // 🔹 MAIN
# int main() {

#     std::cout << "Vector 1:\n";
#     for (int i = 0; i < n1; i++) std::cout << v1[i] << " ";

#     std::cout << "\nVector 2:\n";
#     for (int i = 0; i < n2; i++) std::cout << v2[i] << " ";

#     std::cout << "\nMayores por suma:\n";
#     mayores_suma(v1, n1, v2, n2);

#     return 0;
# }
    .data

# 🔹 Tamaño double
sizeD = 8

# 🔹 Constantes double
zeroD: .double 0.0

# 🔹 Cadenas
msg_v1:        .asciiz "Vector 1:\n"
msg_v2:        .asciiz "\nVector 2:\n"
msg_mayores:   .asciiz "\nMayores por suma:\n"
espacio:       .asciiz " "
salto_linea:   .asciiz "\n"

# 🔹 Vectores
.align 3
v1: .double 10.0, 8.0, 6.0, 4.0, 2.0, -1.0
n1: .word 6

.align 3
v2: .double 9.0, 7.0, 6.0, 3.0, 1.0
n2: .word 5


	.text

# // 🔹 FUNCIÓN CORTA
# // Devuelve la suma de los elementos positivos
# double suma_positivos(double* v, const int n) {
suma_positivos:
# Parámetros de entrada:
# v -> $a0
# n -> $a1
# Parámetros de salida:
# suma -> $f0 -> $f4

# Tabla de registros:
# i -> $t0

#     int i = 0;
	li $t0,0

#     double suma = 0.0;
	l.d $f4,zeroD

#     while (i < n) {
	suma_positivos_while_condicion:

		blt $t0,$a1,suma_positivos_while_dentro
		b suma_positivos_while_fuera

	suma_positivos_while_dentro:

#         if (v[i] > 0) {
		suma_positivos_if_condicion:

			mul $t1,$t0,sizeD
			add $t1,$t1,$a0

			l.d $f6,0($t1)
			
			l.d $f8,zeroD

			c.le.d $f6,$f8
			bc1f suma_positivos_if_dentro
			b suma_positivos_if_fuera

		suma_positivos_if_dentro:

#             suma = suma + v[i];
			add.d $f4,$f4,$f6

		suma_positivos_if_fuera:
#         }
#         i++;
		addi $t0,1
		b suma_positivos_while_condicion

	suma_positivos_while_fuera:

#     }

#     return suma;
	mov.d $f0,$f4

# }
	jr $ra

suma_positivos__MARCAFIN:

# // 🔹 FUNCIÓN MEDIA
# // Muestra los elementos de v1 cuya suma acumulada supera a la de v2
# void mayores_suma(double* v1, const int n1, double* v2, const int n2) {
mayores_suma:

# Parámetros de entrada:
# v1 -> $a0 -> $s0
# n1 -> $a1 -> $s1
# v2 -> $a2 -> $s2
# n2 -> $a3 -> $s3

# Parámetros de salida:

# Tabla de registros:
# suma2 -> $f20
# i -> $s4
# suma1 -> $f22

# Esta función usa la pila:
# push: $s0, $s1, $s2, $s3, $s4, $ra, $f20, $f22
	addi $sp,-40
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $s4,16($sp)
	sw $ra,20($sp)
	s.d $f20,24($sp)
	s.d $f22,32($sp)

	move $s0,$a0
	move $s1,$a1
	move $s2,$a2
	move $s3,$a3

#     double suma2 = suma_positivos(v2, n2);
	move $a0,$s2
	move $a1,$s3

	jal suma_positivos
	mov.d $f20,$f0

#     int i = 0;
	li $s4,0

#     double suma1 = 0.0;
	li.d $f22,0.0

#     while (i < n1) {
	mayores_suma_while_condicion:

		blt $s4,$s1,mayores_suma_while_dentro
		b mayores_suma_while_fuera

	mayores_suma_while_dentro:

#         suma1 = suma1 + v1[i];
		mul $t0,$s4,sizeD
		add $t0,$t0,$s0
	
		l.d $f4,0($t0)

		add.d $f22,$f22,$f4

#         if (suma1 > suma2) {
		mayores_suma_if_condicion:

			c.le.d $f22,$f20
			bc1f mayores_suma_if_dentro
			b mayores_suma_if_fuera

		mayores_suma_if_dentro:

#             std::cout << v1[i] << " ";
			li $v0,3
			mov.d $f12,$f4
			syscall

			li $v0,11
			li $a0,' '
			syscall

		mayores_suma_if_fuera:
#         }

#         i++;
		addi $s4,1
		b mayores_suma_while_condicion

	mayores_suma_while_fuera:
#     }

#     std::cout << "\n";
	li $v0,11
	li $a0,10
	syscall

# }

# pop: $s0, $s1, $s2, $s3, $s4, $ra, $f20, $f22
	
	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $s4,16($sp)
	lw $ra,20($sp)
	l.d $f20,24($sp)
	l.d $f22,32($sp)
	addi $sp,40

	jr $ra
mayores_suma__MARCAFIN:

# // 🔹 MAIN
# int main() {
main:
# Tabla de registros:
# i -> $s0
# v1 -> $s1
# n1 -> $s2
# v2 -> $s3
# n2 -> $s4

#     std::cout << "Vector 1:\n";
	li $v0,4
	la $a0,msg_v1
	syscall

	li $s0,0
	lw $s2,n1
	la $s1,v1
#     for (int i = 0; i < n1; i++) 
	for_condicion:

		blt $s0,$s2,for_dentro
		b for_fuera

	for_dentro:

#	std::cout << v1[i] << " ";
		mul $t0,$s0,sizeD
		add $t0,$t0,$s1
		l.d $f4,0($t0)

		li $v0,3
		mov.d $f12,$f4
		syscall

		li $v0,11
		li $a0,' '
		syscall

		addi $s0,1
		b for_condicion

	for_fuera:


#     std::cout << "\nVector 2:\n";
	li $v0,4
	la $a0,msg_v2
	syscall

	li $s0,0
	lw $s4,n2
	la $s3,v2
#     for (int i = 0; i < n2; i++) 
	for2_condicion:

		blt $s0,$s4,for2_dentro
		b for2_fuera

	for2_dentro:

#	std::cout << v2[i] << " ";
		mul $t0,$s0,sizeD
		add $t0,$t0,$s3
		l.d $f4,0($t0)

		li $v0,3
		mov.d $f12,$f4
		syscall

		li $v0,11
		li $a0,' '
		syscall

		addi $s0,1
		b for2_condicion		

	for2_fuera:

#     std::cout << "\nMayores por suma:\n";
	li $v0,4
	la $a0,msg_mayores
	syscall

#     mayores_suma(v1, n1, v2, n2);
	la $s1,v1
	lw $s2,n1
	la $s3,v2
	lw $s4,n2

	move $a0,$s1
	move $a1,$s2
	move $a2,$s3
	move $a3,$s4

	jal mayores_suma

#     return 0;
	li $v0,10
	syscall
# }