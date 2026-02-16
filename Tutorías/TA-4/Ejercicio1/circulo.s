	.data

str_radio:	.asciiz "Introduce el radio del círculo en metros en formato decimal (n.m): "
str_area:	.asciiz "El área del círuclo es: "

	.text

main:
	# Enviamos un mensaje por pantalla
	li $v0,4
	la $a0,str_radio
	syscall

	# Pedimos al usuario el radio
	li $v0,6
	syscall

	# Guardamos el radio
	mov.s $f20,$f0

	# Calculamos el área
	li.s $f4,3.1415

	mul.s $f20,$f20,$f20
	mul.s $f20,$f20,$f4

	# Enviamos un mensaje por pantalla
	li $v0,4
	la $a0,str_area
	syscall

	# Enviamos el área por pantalla
	li $v0,2
	mov.s $f12,$f20
	syscall

	# Terminamos el programa
	li $v0,10
	syscall