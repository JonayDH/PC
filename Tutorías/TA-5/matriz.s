# int mat[3][4] = {

# 	{00, 01, 02, 03},
#  	{10, 11, 12, 13},
# 	{20, 21, 22, 23},
# };

# int s0 = 1;
# int s1 = 2;
# s5 = mat[s0][s1];

# mat[s0][s1] = s6;


# Las matrices se almacenan en vectores por filas
# Para un elemento (i,j): dirección base + i * tamaño_fila + j * tamaño_elementos
# También podemos usar: dirección base + (i * numero_columnas + j) * tamaño_elementos
# tamaño_fila = numero_columnas * tamaño_elementos

.data

	mat:

		.word 00, 01, 02, 03
		.word 10, 11, 12, 13
		.word 20, 21, 22, 23

	tam_fila = 16
	tam_elementos = 4

.text

main:

# int s0 = 1;
	li $s0,1

# int s1 = 2;
	li $s1,2

# s5 = mat[s0][s1];
	la $t0,mat

	mul $t1,$s0,tam_fila # i * tamaño_fila
	mul $t2,$s1,tam_elementos # j * tamaño_elementos
	add $t3,$t1,$t2 # i * tamaño_fila + j * tamaño_elementos
	add $t4,$t3,$t0 # dirección base + i * tamaño_fila + j * tamaño_elementos

	lw $s5,0($t4) # Cargamos en s5 el elemento [1][2]

# mat[s0][s1] = s6;

	sw $s6,0($t4)

	li $v0,10
	syscall

