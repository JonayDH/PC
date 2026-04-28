# // Principio de Computadores.
# // Operaciones con funciones y direccionamiento indirecto
# // Autores: Carlos Martín Galán y Alberto Hamilton Castro
# // Fecha última modificación: 2025-04-11
# #include <iostream>

# const int n1 = 10;
# double v1[n1] = {10.5, 9.5, 7.25, 6.25, 5.75, 4.5, 4.25, 3.5, -1.5, -2.0};
# const int n2 = 5;
# double v2[n2] = {5.5, 4.5, 4.25, 2.5, 2.5 };
# const int n3 = 4;
# double v3[n3] = {7.0, 5.0, 2.0, 1.0};


# void printvec(double* v, const int n) {
#     std::cout << "\nVector con dimension " << n << '\n';
#     for (int i = 0; i < n; i++)
#         std::cout << v[i] << " ";

#     std::cout << "\n";
#     return;
# }

# int ordenado(double* v, const int n) {
#     int resultado = 1;
#     int i = 0;
#     while (i < n-1) {
#         if (v[i+1] >= v[i]) {
#             resultado = 0;
#             break;
#         }
#         i++;
#     }
#     return resultado;
# }

# void merge(double* v1, const int n1,double* v2, const int n2) {

#     int  o1 = ordenado(v1,n1);
#     if (o1 == 0) {
#       std::cout << "Primer vector no ordenado. NO se puede mezclar\n";
#       return;
#     }
#     int o2 = ordenado(v2,n2);
#     if (o2 == 0) {
#       std::cout << "Segundo vector no ordenado. NO se puede mezclar\n";
#       return;
#     }
#     int i = 0; // índice para recorrer el v1
#     int j = 0; // índice para recorrer el v2
#     while ( ( i < n1) && (j < n2) ) {
#         if (v1[i] >= v2[j]) {
#             std::cout << v1[i] << ' ';
#             i++;
#         }
#         else {
#             std::cout << v2[j] << ' ';
#             j++;
#         }
#     }
#     while ( i < n1) {
#         std::cout << v1[i] << ' ';
#         i++;
#     }
#     while ( j < n2) {
#         std::cout << v2[j] << ' ';
#         j++;
#     }
#     std::cout << '\n';
#     return;
# }

# int main(void) {
#   std::cout << "\nPrograma de mezcla de vectores\n";

#   printvec(v1,n1);
#   printvec(v2,n2);
#   printvec(v3,n3);

#   std::cout << "\nIntentando mezcla con dos vectores ...\n";
#   merge(v1,n1,v2,n2);

#   std::cout << "\nIntentando mezcla con dos vectores ...\n";
#   merge(v1,n1,v3,n3);

#   std::cout << "\nIntentando mezcla con dos vectores ...\n";
#   merge(v2,n2,v3,n3);

#   std::cout << "\nFIN DEL PROGRAMA\n";
#   return 0;
# }

sizeD = 8

    .data
n1:     .word 10
v1:     .double 10.5, 9.5, 7.25, 6.25, 5.75, 4.5, 4.25, 3.5, -1.5, -2.0
n2:     .word 5
v2:     .double 5.5, 4.5, 4.25, 2.5, 2.5
n3:     .word 4
v3:     .double 7.0, 5.0, 2.0, 1.0

cad0:	.asciiz	"\nPrograma de mezcla de vectores\n"
cad1:   .asciiz "\nVector con dimension "
cad51:	.asciiz	"Primer vector no ordenado. NO se puede mezclar\n"
cad52:	.asciiz	"Segundo vector no ordenado. NO se puede mezclar\n"
cad2:   .asciiz "\nIntentando mezcla con dos vectores ...\n"
cad3:   .asciiz "\nFIN DEL PROGRAMA\n"


    .text

# void printvec(double* v, const int n) {
printvec:
# Parámetros de entrada:
# v -> $a0 -> $s0
# n -> $a1 -> $s1
# Parámetros de salida:

# Tabla de registros:
# i -> $s2

# Esta función usa la pila:
# Push: $s0, $s1, $s2, $ra
	addi $sp,-16
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $ra,12($sp)

	move $s0,$a0
	move $s1,$a1

#     std::cout << "\nVector con dimension " << n << '\n';
	li $v0,4
	la $a0,cad1
	syscall

	li $v0,1
	move $a0,$s1
	syscall

	li $v0,11
	li $a0,10
	syscall

	li $s2,0
#     for (int i = 0; i < n; i++)
	printvec_for_condicion:

		blt $s2,$s1,printvec_for_dentro
		b printvec_for_fuera

	printvec_for_dentro:

#         std::cout << v[i] << " ";
		mul $t0,$s2,sizeD
		add $t0,$t0,$s0

		l.d $f4,0($t0)

		li $v0,3
		mov.d $f12,$f4
		syscall

		li $v0,11
		li $a0,' '
		syscall

		addi $s2,1
		b printvec_for_condicion

	printvec_for_fuera:

#     std::cout << "\n";
	li $v0,11
	li $a0,10
	syscall
#     return;

# Pop: $s0, $s1, $s2, $ra
	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $ra,12($sp)
	addi $sp,16

	jr $ra

# }
printvec__MARCAFIN:



# int ordenado(double* v, const int n) {
ordenado:
# Parámetros de entrada:
# v -> $a0 -> $s0
# n -> $a1 -> $s1
# Parámetros de salida:
# resultado -> $v0

# Tabla de registros:
# resultado -> $s2
# i -> $s3

# Esta función usa la pila:
# Push: $s0, $s1, $s2, $s3, $ra
	addi $sp,-20
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $ra,16($sp)

	move $s0,$a0
	move $s1,$a1

#     int resultado = 1;
	li $s2,1

#     int i = 0;
	li $s3,0

#     while (i < n-1) {
	ordenado_while_condicion:

		sub $t0,$s1,1
		blt $s3,$t0,ordenado_while_dentro
		b ordenado_while_fuera

	ordenado_while_dentro:

#         if (v[i+1] >= v[i]) {
		ordenado_if_condicion:

			mul $t0,$s3,sizeD
			add $t0,$t0,sizeD
			add $t0,$t0,$s0
			l.d $f4,0($t0)

			mul $t0,$s3,sizeD
			add $t0,$t0,$s0
			l.d $f6,0($t0)

			c.lt.d $f4,$f6
			bc1f ordenado_if_dentro
			b ordenado_if_fuera

		ordenado_if_dentro:
#             resultado = 0;
			li $s2,0

#             break;
			b ordenado_while_fuera
#         }
		ordenado_if_fuera:
#         i++;
		addi $s3,1
		b ordenado_while_condicion
#     }
	ordenado_while_fuera:
#     return resultado;
	move $v0,$s2

# }
# Push: $s0, $s1, $s2, $s3, $ra
	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $ra,16($sp)
	addi $sp,20

	jr $ra

ordenado__MARCAFIN:

# void merge(double* v1, const int n1,double* v2, const int n2) {
merge:
# Parámetros de entrada:
# v1 -> $a0 -> $s0
# n1 -> $a1 -> $s1
# v2 -> $a2 -> $s2
# n2 -> $a3 -> $s3
# Parámetros de salida:

# Tabla de registros:
# o1 -> $t0
# o2 -> $t1
# i -> $s4
# j -> $s5

# Esta función usa la pila
# Push: $s0, $s1, $s2, $s3, $s4, $s5, $ra

	addi $sp,-28
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $s4,16($sp)
	sw $s5,20($sp)
	sw $ra,24($sp)

	move $s0,$a0
	move $s1,$a1
	move $s2,$a2
	move $s3,$a3

#     int  o1 = ordenado(v1,n1);
	move $a0,$s0
	move $a1,$s1

	jal ordenado

#     if (o1 == 0) {
	merge_if_condicion:

		beqz $v0,merge_if_dentro
		b merge_if_fuera

	merge_if_dentro:

#       std::cout << "Primer vector no ordenado. NO se puede mezclar\n";
		li $v0,4
		la $a0,cad51
		syscall

#       return;
		b merge_pop
#     }
	merge_if_fuera:

#     int o2 = ordenado(v2,n2);
	move $a0,$s0
	move $a1,$s1

	jal ordenado

#     if (o2 == 0) {
	merge_if2_condicion:

		beqz $v0,merge_if2_dentro
		b merge_if2_fuera

	merge_if2_dentro:

#       std::cout << "Segundo vector no ordenado. NO se puede mezclar\n";
		li $v0,4
		la $a0,cad52
		syscall

#       return;
		b merge_pop
#     }
	merge_if2_fuera:

#     int i = 0; // índice para recorrer el v1
#     int j = 0; // índice para recorrer el v2
#     while ( ( i < n1) && (j < n2) ) {
#         if (v1[i] >= v2[j]) {
#             std::cout << v1[i] << ' ';
#             i++;
#         }
#         else {
#             std::cout << v2[j] << ' ';
#             j++;
#         }
#     }
#     while ( i < n1) {
#         std::cout << v1[i] << ' ';
#         i++;
#     }
#     while ( j < n2) {
#         std::cout << v2[j] << ' ';
#         j++;
#     }
#     std::cout << '\n';
#     return;
# }
	merge_pop:

	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $s4,16($sp)
	lw $s5,20($sp)
	lw $ra,24($sp)
	addi $sp,28

	jr $ra

merge__MARCAFIN:

# int main(void) {
main:

#   std::cout << "\nPrograma de mezcla de vectores\n";
	li $v0,4
	la $a0,cad0
	syscall

#   printvec(v1,n1);
	la $t0,v1
	lw $t1,n1

	move $a0,$t0
	move $a1,$t1

	jal printvec

#   printvec(v2,n2);
	la $t0,v2
	lw $t1,n2

	move $a0,$t0
	move $a1,$t1

	jal printvec

#   printvec(v3,n3);
	la $t0,v3
	lw $t1,n3

	move $a0,$t0
	move $a1,$t1

	jal printvec

#   std::cout << "\nIntentando mezcla con dos vectores ...\n";
	li $v0,4
	la $a0,cad2
	syscall

#   merge(v1,n1,v2,n2);
	la $t0,v1
	lw $t1,n1
	la $t2,v2
	lw $t3,n2

	move $a0,$t0
	move $a1,$t1
	move $a2,$t2
	move $a3,$t3

	jal merge

#   std::cout << "\nIntentando mezcla con dos vectores ...\n";
	li $v0,4
	la $a0,cad2
	syscall

#   merge(v1,n1,v3,n3);
	la $t0,v1
	lw $t1,n1
	la $t2,v3
	lw $t3,n3

	move $a0,$t0
	move $a1,$t1
	move $a2,$t2
	move $a3,$t3

	jal merge

#   std::cout << "\nIntentando mezcla con dos vectores ...\n";
	li $v0,4
	la $a0,cad2
	syscall

#   merge(v2,n2,v3,n3);
	la $t0,v2
	lw $t1,n2
	la $t2,v3
	lw $t3,n3

	move $a0,$t0
	move $a1,$t1
	move $a2,$t2
	move $a3,$t3

	jal merge

#   std::cout << "\nFIN DEL PROGRAMA\n";
#   return 0;
	li $v0,4
	la $a0,cad3
	syscall

	li $v0,10
	syscall
# }