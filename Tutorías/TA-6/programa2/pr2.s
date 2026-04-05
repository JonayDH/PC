# #include <iostream>
# #include <vector>

# using namespace std;

# int max_vector(const vector<int>&v) {

# 	int max_vector{v[0]};

# 	for (size_t i{1}; i < v.size(); i++) {


# 		if (v[i] > max_vector) {

# 			max_vector = v[i];
# 		}
# 	}

# 	return max_vector;
# }

# int main() {

# 	vector<int>v{1,3,5,20,3,56,2,6,9,4};

# 	cout << "El elemento más grande del vector es: " << max_vector(v);
# }

.data

	vec:	
		.word 1, 3, 5, 20, 3, 56, 2, 6, 9, 4

	cad1:	.asciiz "El elemento más grande del vector es: "

	vec_size: .word 10

	vec_elem_size: .word 4

.text

# int max_vector(const vector<int>&v) {
max_vector:
# Función que calcula el máximo de un vector
# Parámetros:
# vec_size -> $a0
# vec_elem_size -> $a1
# inicio vector -> $a2
#
# Tabla de registros:
# max_vector -> $s0
# i -> $t1
# vec_size -> $t2
# vec_elem_size -> $t3
# inicio vector -> $t4

	addi $sp,-4
	sw $s0,0($sp)

	move $t2,$a0
	move $t3,$a1
	move $t4,$a2

# 	int max_vector{v[0]};
	lw $s0,0($t4)

# 	for (size_t i{1}; i < v.size(); i++) {
	li $t1,1

	for_condicion:

		blt $t1,$t2,for_dentro
		b for_fuera

	for_dentro:
# 		if (v[i] > max_vector) {
		if_condicion:

			mul $t5,$t1,$t3
			add $t6,$t4,$t5
			lw $t5,0($t6)

			bgt $t5,$s0,if_dentro
			b if_fuera

		if_dentro:

# 			max_vector = v[i];
			move $s0,$t5
# 		}
		if_fuera:

		addi $t1,1
		b for_condicion
# 	}
	for_fuera:

# 	return max_vector;
	move $v0,$s0

	lw $s0,0($sp)
	addi $sp,4
	jr $ra
# }


main:

# int main() {

# 	vector<int>v{1,3,5,20,3,56,2,6,9,4};

	lw $s0,vec_size
	lw $s1,vec_elem_size
	la $s2,vec

# 	cout << "El elemento más grande del vector es: " << max_vector(v);
	li $v0,4
	la $a0,cad1
	syscall

	move $a0,$s0
	move $a1,$s1
	move $a2,$s2
	jal max_vector
	move $a0,$v0

	li $v0,1
	syscall

	li $v0,10
	syscall
# }

