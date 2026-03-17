# int vec[4] = {3,9,5,7};

# int s5 = 3;
# int s0 = vec[s5];

# int s6 = 0;
# int s1 = vec[s6];
# vec[s5] = 0;

# dirección base + i * tamaño dato

.data

	vector:
		.word 3, 9, 5, 7

# Constante el tiempo de compilado (tamaño de los datos)
tamW = 4

.text

main:

	la $t0,vector

# int s5 = 3;
	li $s5,3

# int s0 = vec[s5];
	mul $t1,$s5,tamW # Calculamos el desplazamiento
	add $t2,$t1,$t0 # Se lo sumamos al inicio del vector
	lw $s0,0($t2) # Cargamos el resultado en $s0

# int s6 = 0;
	li $s6,0

# int s1 = vec[s6];
	mul $t1,$s6,tamW # Calculamos el desplazamiento
	add $t2,$t1,$t0 # Se lo sumamos al inicio del vector
	lw $s1,0($t2) # Cargamos el resultado en $s1

# vec[s5] = 0;
	mul $t1,$s5,tamW # Calculamos el desplazamiento
	add $t2,$t1,$t0 # Se lo sumamos al inicio del vector
	sw $zero,0($t2) # Guardamos un 0 en vec[3]

# Acabamos el programa
	li $v0,10
	syscall

