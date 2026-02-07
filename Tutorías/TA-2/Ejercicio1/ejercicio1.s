# Código de un switch

	.text

main:

	li $t0,3

switch:

	beq $t0,1,case1
	beq $t0,2,case2
	beq $t0,3,case3
	beq $t0,4,case4
	b case_default

case1:

	li $t1,1
	b switch_end

case2:

	li $t1,2
	b switch_end

case3:

	li $t1,3
	b switch_end

case4:

	li $t1,4
	b switch_end

case_default:

	move $t1,$t0

switch_end:

	li $v0,10
	syscall