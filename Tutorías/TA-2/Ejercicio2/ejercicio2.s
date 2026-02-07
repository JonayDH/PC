# Código de un do-while

	.text

main:

	move $t0,$zero

do:

	addi $t0,5

while:

	blt $t0,3,do

	li $v0,10
	syscall