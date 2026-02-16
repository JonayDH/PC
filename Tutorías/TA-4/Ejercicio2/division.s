	.data

str_dividendo:	.asciiz "Introduce el dividendo (flotante simple precisión): "
str_divisor:	.asciiz "Introduce el divisor (floante simple precisión): "
str_error:	.asciiz "El divisor no puede ser 0, Introduzca otro divisor: "
str_resultado:	.asciiz "El resultado de la división es: "

	.text

main:

	# Enviamos un mensaje por pantalla (introduce dividendo)
	li $v0,4
	la $a0,str_dividendo
	syscall

	# Pedimos un float (dividendo)
	li $v0,6
	syscall

	# Guardamos el float (dividendo)
	mov.s $f20,$f0

	# Enviamos un mensaje por pantalla (introduce divisor)
	li $v0,4
	la $a0,str_divisor
	syscall

	# Pedimos un float (divisor)
	li $v0,6
	syscall

	# Guardamos el float (divisor)
	mov.s $f22,$f0

	while_condicion:

		# Metemos el 0 en un registro
		move $t0,$zero

		# Pasamos el 0 a un registro flotante
		mfc1 $t0,$f4

		# Convertimos a flotante simple precisión
		cvt.s.w $f4,$f4

		# Comprobamos si el divisor es 0
		c.eq.s $f22,$f4
		bc1t while_dentro
		bc1f while_fin

	while_dentro:

		# Enviamos un mensaje de error
		li $v0,4
		la $a0,str_error
		syscall

		# Pedimos el divisor otra vez
		li $v0,6
		syscall

		# Guardamos el divisor
		mov.s $f22,$f0

		# Comprobamos el while
		b while_condicion

	while_fin:

	# Hacemos al división
	div.s $f24,$f20,$f22

	# Imprimos un mensaje por pantalla
	li $v0,4
	la $a0,str_resultado
	syscall

	# Imprimimos el resultado en pantalla
	li $v0,2
	mov.s $f12,$f24
	syscall

	# Terminamos el programa
	li $v0,10
	syscall