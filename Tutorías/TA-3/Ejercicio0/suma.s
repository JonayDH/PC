	.data

cadena_pregunta: .asciiz "Introduce un número: "
cadena_resultado: .asciiz "El resultado es: "

	.text

main:

	li $v0,4 # Envía un mensaje por pantalla
	la $a0,cadena_pregunta # cadena_pregunta será el mensaje a imprimir
	syscall

	li $v0,5 # Pide un número
	syscall
	move $s0,$v0

	li $v0,4 # Envía un mensaje por pantalla
	la $a0,cadena_pregunta # cadena_pregunta será el mensaje a imprimir
	syscall

	li $v0,5 # Pide otro número
	syscall
	move $s1,$v0

	li $v0,11 # Envía un caracter por pantalla
	li $a0,'\n' # \n será el caracter a imprimir (salto de línea)
	syscall

	add $s2,$s0,$s1 # Suma los números

	li $v0,4 # Imprime un mensaje por pantalla
	la $a0,cadena_resultado # cadena_resultado será el mensaje a imprimir
	syscall

	li $v0,1 # Imprime el número
	move $a0,$s2 # $s2 será el número a imprimir
	syscall

	li $v0,11 # Envía un caracter por pantalla
	li $a0,'\n' # \n será el caracter a imprimir (salto de línea)
	syscall

	li $v0,10 # Finaliza el programa
	syscall
