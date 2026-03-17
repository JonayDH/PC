# struct datos {
# 	float largo;
# 	double peso;
# 	int elementos;
# };

# datos objeto1 {
# 	109.45,
# 	56.12,
# 	4
# };

# datos objeto2 {
# 	35.7,
# 	25.9,
# 	2
# };

# int s1 = objeto1.elementos;
# float f21 = objeto1.largo;
# double f22 = objeto1.peso;

# int s2 = objeto2.elementos;

# float: 4 bytes
# int: 4 bytes
# double: 8 bytes

.data

	objeto1:

		.float 109.45
		.double 56.12
		.word 4

	objeto2:

		.float 35.7
		.double 25.9
		.word 2

.text

main:

	la $t0,objeto1

# int s1 = objeto1.elementos;
	lw $s1,12($t0)

# float f21 = objeto1.largo;
	l.s $f21,0($t0)

# double f22 = objeto1.peso;
	l.d $f22,4($t0)

# int s2 = objeto2.elementos;
	la $t0,objeto2

	lw $s2,12($t0)

	li $v0,10
	syscall