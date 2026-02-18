# Programa para convertir de grados Fahrenheit a Celsius
# Usa la fórmula C = (F - 32)/1.8
	.data
str_pideF:	.asciiz	"Introduzca grados Fahrenheit (entero): "
str_celsius:	.asciiz	"Temperatura en grados Celsius: "
str_fin:	.asciiz	"\nTermina el programa\n"
	.text
main:
	# Sacamos cadena de petición de Fahrenheit
	li	$v0,4
	la	$a0,str_pideF
	syscall
	# Esperamos a que se introduzca un entero
	li	$v0,5
	syscall
	move	$s0,$v0    	# Valor recibido a registro salvado $s0
	# Pasamos entero a float
	mtc1	$s0,$f20	# $f20 = $s0
	cvt.d.w	$f22,$f20	# $f22 = $f20
	# Hacemos la operación
	li.d	$f4,32.0	# $f4 = 32.0
	sub.d	$f24,$f22,$f4	# $f24 = $f22 - $f4
	li.d	$f4,1.8	# $f4 = 1.8
	div.d	$f24,$f24,$f4	# $f24 = $f24 / $f4
	# Mostramos resultado con mensaje previo
	li	$v0,4
	la	$a0,str_celsius
	syscall
	# Imprimimos el resultado
	li	$v0,3
	mov.d	$f12,$f24
	syscall
	
	# Mensaje de fin
	li	$v0,4
	la	$a0,str_fin
	syscall
	
	# Terminamos el programa
	li	$v0,10
	syscall
	
	
