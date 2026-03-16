# int vec[4] = {3,9,5,7};

# int s0 = vec[3];
# int s1 = vec[0];
# int s2 = vec[2];

.data

	vector:

		.word 3,9,5,7

.text

main:

	la $t0,vector

# int s0 = vec[3];
# 4 * 3 = 12
	lw $s0,12($t0)

# int s1 = vec[0];
# 4 * 0 = 0
	lw $s1,0($t0)

# int s2 = vec[2];
# 4 * 2 = 8
	lw $s2,8($t0)

	li $v0,10
	syscall