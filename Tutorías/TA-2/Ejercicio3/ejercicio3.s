# Evaluación expresión if (($s0 < $s1) && ($s1 == $s2))    $s5 = 1

	.text

main:

	li $s0,3
	li $s1,4
	li $s2,4

if:

	slt $t0,$s0,$s1
	beqz $t0,if_end

	seq $t1,$s1,$s2
	beqz $t1,if_end

	b if_then

if_then:

	li $s5,1

if_end:

	li $v0,10
	syscall