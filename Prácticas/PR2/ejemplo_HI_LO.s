
    .text
main:
    # A continuacion se muestra un ejemplo de division entera no exacta (tiene cociente y resto)
    li $t0,5   # cargo un valor de 5 en el registro $t0
    li $t1,3   # cargo un valor de 3 en el registro $t1
    div $t0,$t1  # la instrucción div con dos operandos divide $t0 entre $t1
                 # y el resultado lo deja en dos registros internos llamados LO y HI
                 # LO tiene el cociente y HI tiene el resto
                 
    mflo $t2     # esta instruccion mueve el registro interno LO a $t2, luego $t2 es el
                 # cociente de $t0/$t1
    mfhi $t3     # esta instruccion mueve el registro interno HI a $t3, luego $t3 es el
                 # resto de $t0/$t1
    
    mtc1 $t0,$f4
    mtc1 $t1,$f6

    cvt.d.w $f20,$f4
    cvt.d.w $f22,$f6

    div.d $f24,$f20,$f22

    li $v0,3
    mov.d $f12,$f24
    syscall

    # A continuacion se muestra una multiplicacion cuyo resultado no cabe en 32 bits
    # Multiplicar un entero por 2 significa desplazar todos sus bits a la izquiera
    # por lo tanto, multiplicarlo por 16 = 2 * 2 * 2 * 2 es lo mismo que desplazarlo
    # 4 bits a la izquierda 
   # li $t0,0x7FFFFFFF   # cargo el mayor entero positivo posible en $t0 (todos los bits a 1 
                        # menos el bit de signo)
    #li $t1,16           # cargo un valor de 16 en el registro $t1
    #mult $t0,$t1        # la instrucción mult multiplica $t0 por $t1
                        # y el resultado lo deja en dos registros internos llamados LO y HI
                 # LO tiene los 32 bits menos significativos del resultado y HI tiene los 
                 # 32 bits mas significativos del resultado
                 # el resultado de la multiplicación en hexadecimal sera pues
                 # HI =  0x00000007 LO = 0xFFFFFFF0 compruebalo en Qtspim 
                 
    #mflo $t2     # esta instruccion mueve el registro interno LO a $t2, 
    #mfhi $t3     # esta instruccion mueve el registro interno HI a $t3 



    li $v0,10
    syscall