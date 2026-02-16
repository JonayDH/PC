# ------------- INICIO DEL CÓDIGO -------------------
    .data
titulo:     .asciiz "Práctica 1 PC. Depurando en QtSpim.\n"
x:          .word  13532
y:          .word  0
msg1:       .asciiz "El número de iteraciones es: "  

    .text
main:
    li $v0,4
    la $a0,titulo
    syscall
    lw $s0, x
    move $s1, $zero
    li $s2, 2
    li $s3, 3
    li $s4, 1 # iteracion
    calculo:
        beqz $s0, fin
        mult $s0,$s2
        mflo $s0
        div $s0, $s3
        mflo $s0
        li $v0,1
        move $a0, $s0
        syscall
        li $v0,11
        li $a0, '\n'
        syscall
        beqz $s0, siguiente
            sw $s0, y
        siguiente:
        addi $s4,1
        j calculo
    fin:

    li $v0,4
    la $a0,msg1
    syscall

    li $v0,1
    move $a0, $s4
    syscall

    li $v0,10
    syscall

# ------------- FIN DEL CÓDIGO -------------------