# Ejemplos de estructuras:

# Video explicativo:
# https://tuvideo.txs.es/w/p/wuieoR2JdoRCKC7YR8AfAq?playlistPosition=3



# Alternativa IF:


# Código C++:

if ($s0 != $s1) { # Condición

  $s3 = $s1; # Dentro IF (then)
}
# Después IF


# Código MIPS:

if: # Condición
    bne     $s0,$s1,if-then
    b   if-fin

if-then: # Dentro IF (then)
    move $s3,$s1

if-fin: # Después IF



# Alternativa IF-ELSE:


# Código C++:

if ($s0 != $s1) { # Condición

  $s3 = $s1; # Dentro IF (then)
} else { # Else

  $s3 = $s0; # Dentro Else
}
# Después IF


# Código MIPS:

if: # Condición

    bne     $s0,$s1,if-then
    b   else

if-then: # Dentro IF (then)

    move $s3,$s1
    b if-fin

else: # Else

    move    $s3,$s0

if-fin: # Después IF



# Alternativa WHILE:


# Código C++:

suma = 0;
std::cin >> numero;

while (numero > 0) { # Condición

  suma += numero; # Dentro while
  std::cin >> numero;
}


# Código MIPS:

# suma -> $s0
# numero -> $v0

    # metemos un 0 a la suma
    move    $s0,$zero

    # leo entero por la consola
    li    $v0,5
    syscall

while: #condición

    bgtz    $v0,while-dentro
    b   while-fuera

while-dentro: #while dentro

    add $s0,$s0,$v0

    # leo entero por la consola
    li  $v0,5
    syscall

    b while

while-fin: # Después while



# Alternativa for


# Código C++:

suma = 0;

for (int i = 0; i <= 100; i++) {

  suma += i;
}


# Código MIPS:

# suma -> $s0
# i -> $t0

move $s0,$zero
move $t0,$zero

for:

    ble $t0,100,for-dentro #condición
    b for-fin

for-dentro:

    add $s0,$s0,$t0 #suma +=i
    addi $t0,$t0,1 #i++
    b for

for-fin: #después for



# Condiciones booleanas


# Código C++:

if ( (($s1 > $2) && ($s1 <= $s3)) || ($s4 < 0)) {

  $s1 ++;
}

# Código MIPS:

if:

  sgt $t0,$s1,$s2 # $t0 = ($s1 > $2)
  sle $t1,$s1,$3 # $t1 = ($s1 <= $s3)
  and $t2,$t1,$t0 # $t2 = ($t1 & $t0) -> (($s1 > $2) && ($s1 <= $s3))

  slt $t3,$s4,$zero # $t3 = ($s4 < 0)

  or $t5,$t2,$t3 # $t5 = ($t2 | $t3) -> (($s1 > $2) && ($s1 <= $s3)) || ($s4 < 0))
  beqz $t5,if-end # Si no se cumple (si es = 0)

  addi $s1,$s1,1

if-end:

# También se puede comprobar primero si la primera parte (($s1 > $2) && ($s1 <= $s3)) se cumple y saltar directamente al if

if:

  bgt $s1,$s2,if-cumple1
  b if-nocumple1

if-cumple1:

  ble $s1,$s3,if-then

if-nocumple1:

  bltz $s4,if-then
  b if-end

if-then:

  addi $s1,$s1,1

if-end:

