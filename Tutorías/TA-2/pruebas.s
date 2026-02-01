.data

numero1: .word 15
numero2: .word 2

.text

main:
  lw $t0, numero1
  lw $t1, numero2

  add $t2, $t0, $t1

  move $a0, $t2
  li $v0, 1
  syscall

  li $v0, 10
  syscall

