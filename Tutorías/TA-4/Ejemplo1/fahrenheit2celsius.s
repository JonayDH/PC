        .data

grados:		.asciiz "Introduzca grados Fahrenheit (entero)"
celsius:    	.asciiz "Temperatura en grados Celsius: "
fin:       	.asciiz "\nTermina el programa\n"

        .text

main:

	# Tabla de registros:
	# F -> $s0
	# C -> $f20

	# std::cout << "Introduzca grados Fahrenheit (entero): ";

	li $v0,4
	la $a0,grados
	syscall

	# int F;

	li $s0,0

	# std::cin >> F;

	li $v0,5
	syscall
	move $s0,$v0

	# float C = (F - 32) / 1.8;

	mtc1 $s0,$f22
	cvt.s.w $f24,$f22

	li.s $f4,32.0
	sub.s $f24,$f24,$f4

	li.s $f4,1.8
	div.s $f20,$f24,$f4

	# std::cout << "Temperatura en grados Celsius: " << C;

	li $v0,4
	la $a0,celsius
	syscall

	li $v0,2
	mov.s $f12,$f20
	syscall

	# std::cout << "\nTermina el programa\n";

	li $v0,4
	la $a0,fin
	syscall

	li $v0,10
	syscall