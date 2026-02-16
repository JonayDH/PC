# Instrucciones para usar MIPS:



# Video explicativo parte 1 instrucciones:
# https://tuvideo.txs.es/w/p/wuieoR2JdoRCKC7YR8AfAq?playlistPosition=2&resume=true

# Instrucciones de movimientos de datos:

lw $t5,etiqueta # "Load word" Carga "etiqueta" en $t5 ($t5 = etiqueta)
sw $t4,etiqueta # "Save word" Guarda $t4 en "etiqueta" (etiqueta = $t4)

li $t3,7 # "Load inmediate" Carga un entero en $t3 ($t3 = 7)
la $t6,etiqueta # "Load address" Sirve para cargar la dirección de memoria de "etiqueta" en $t6 ($t6 = &etiqueta)

move $t1,$t2 # "Move" Copia el valor de $t2 en $t1 ($t1 = $t2)

mflo $t7 # "Move from lo" Mueve el contenido del registro especial LO al registro $t7 ($t7 = LO)
mfhi $t4 # "Move from hi" Mueve el contenido del registro especial HI al registro $t4 ($t4 = HI)



# Instrucciones de operaciones aritméticas con enteros:

add $t2,$t3,$t4 # "Addition" Suma el contenido $t3 y $t4 y lo guarda en $t2 ($t2 = $t3 + $t4)
addi $t3,$t2,4 # Addition immediate" Suma el contenido $t2 y 4 y lo guarda $t3 ($t3 = $t2 + 4)
addi $t4,1 # Suma 1 al valor de $t4 ($t4 += 1) / ($t4 = $t4 + 1)

sub $s1,$t2,$s0 # "Subtract" Resta el contenido de $t2 y $s0 y lo guarda en $s1 ($s1 = $t2 - $s0)

mul $s3,$s4,$s5 # Multiplica el contenido de $s4 y $s5 y lo guarda en $s3. 
                # Este solo guarda los 32 bits menos signitficativos, por lo que si trabajamos con números muy grandes podría 
                # ser un problema ($s3 = $s4 * $s5)
mult $t6,$t7 # Multiplica el contenido de $t6 y $t7. El resultado se almacena en los registros especiales.
             # Los 32 bits más significativos en HI
             # Los 32 bits menos significativos en LO

div $s0,$s1,$s2 # Divide el contenido de $s1 y $s2 y almacena la parte entera en $s0 ($s0 = $s1 / $s2)
div $s1,$s2 # Divide el contenido del registro $s1 y $s2. 
            # El cociente lo coloca en LO (LO = $s1 / $s2)
            # El resto lo coloca en HI (HI = $s1 % $s2)



# Instrucciones de manipulación de bits (Funcionan como las puertas lógicas):

and $t0,$t1,$t2 # Hace el "AND" bit a bit de $t1 y $t2 y lo almacena en $t0 ($t0 = $t1 & $t2)
andi $t0,$t1,7 # Hace el "AND" bit a bit de $t1 y 7 y lo almacena en $t0 ($t0 = $t1 & 7)

or $t0,$t1,$t2 # Hace el "OR" bit a bit de $t1 y $t2 y lo almacena en $t0 ($t0 = $t1 | $t2)
ori $t0,$t1,0xF # Hace el "OR" bit a bit de $t1 y 0xF (número en hexadecimal) y lo almacena en $t0 ($t0 = $t1 | 0xF)

xor $t0,$t1,$t2 # Hace el "XOR" bit a bit de $t1 y $t2 y lo almacena en $t0 ($t0 = $t1 ^ $t2)
xori $t0,$t1,0xD # Hace el "XOR" bit a bit de $t1 y 0xD (número en hexadecimal) y lo almacena en $t0 ($t0 = $t1 ^ 0xD)

not $t0,$t1 # Hace el "NOT" (invierte todos los bits) de $t1 y lo almacena en $t0 ($t0 = ~ $t1)

sll $t3,$t4,2 # "Shift left logical" Desplaza dos bits a la izquierda el contenido del registro $t4 y se rellena con ceros por la derecha. Ejemplo: (101100 -> 110000)
              # El resultado se guarda en $t3 ($t3 = $t4 << 2)
srl $t3,$t4,1 # "Shift right logical" Desplaza un bit a la derecha el contenido del registro $t3 y se rellena con ceros por la izquierda. Ejmplo: (101100 -> 010110)
              # El resultado de guarda en $t3 ($t3 = $t4 >> 1)


# Video explicativo parte 2 instrucciones:
# https://tuvideo.txs.es/w/p/wuieoR2JdoRCKC7YR8AfAq?playlistPosition=3



# Estructuras de control:



# Saltos en MIPS:



# Saltos incondicionales (siempre se ejecutan):

j etiqueta # "Jump" Salta a la línea del código que tenga "etiqueta:" (salto absoluto)
b etiqueta # "Branch" Salta a la línea del código que tenga "etiqueta:" (salto relativo)
jr $t3 # Salta a la dirección de programa contenida en $t3



# Saltos condicionales (saltan a la etiqueta si se cumple la condición):



# Normales:


# Con Signo:

blt $t0,$t1,etiqueta # "Less than" Si $t0 es menor que $t1 salta a "etiqueta:" (if ($t0 < $t1))
ble $t0,$t1,etiqueta # "Less or equal" Si $t0 es menor o igual que $t1 salta a "etiqueta:" (if ($t0 <= $t1))

beq $t0,$t1,etiqueta # "Equal" Si $t0 es igual a $t1 salta a "etiqueta:" (if ($t0 == $t1))
bne $t0,$t1,etiqueta # "Not equal" Si $t0 no es igual a $t1 salta a "etiqueta:" (if ($t0 != $t1))

bge $t0,$t1,etiqueta # "Greater or equal" Si $t0 es mayor o igual que $t1 salta a "etiqueta:" (if ($t0 >= $t1))
bgt $t0,$t1,etiqueta # "Greater than" SI $t0 es mayor que $t1 salta a "etiqueta:" (if ($t0 > $t1))


# Sin Signo:

bltu $t0,$t1,etiqueta # "Less than unsigned" Si $t0 es menor que $t1 salta a "etiqueta:" (if ($t0 < $t1))
bleu $t0,$t1,etiqueta # "Less or equal unsigned" Si $t0 es menor o igual que $t1 salta a "etiqueta:" (if ($t0 <= $t1))

beq $t0,$t1,etiqueta # "Equal" Si $t0 es igual a $t1 salta a "etiqueta:" (if ($t0 == $t1))
bne $t0,$t1,etiqueta # "Not equal" Si $t0 no es igual a $t1 salta a "etiqueta:" (if ($t0 != $t1))

bgeu $t0,$t1,etiqueta # "Greater or equal unsigned" Si $t0 es mayor o igual que $t1 salta a "etiqueta:" (if ($t0 >= $t1))
bgtu $t0,$t1,etiqueta # "Greater than unsigned" SI $t0 es mayor que $t1 salta a "etiqueta:" (if ($t0 > $t1))



# Comparando con el cero:


bltz $t0,etiqueta # "Lower than zero" Si $t0 es menor que cero salta a "etiqueta:" (if ($t0 < 0))
blez $t0,etiqueta # "Lower or equal zero" Si $t0 es menor o igual que cero salta a "etiqueta:" (if ($t0 <= 0))

beqz $t0,etiqueta # "Equal zero" Si $t0 es igual a cero salta a "etiqueta" (if ($t0 == 0))
bnez $t0,etiqueta # "Not equal zero" Si $t0 no es igual a cero salta a "etiqueta" (if ($t0 != 0))

bgez $t0,etiqueta # "Greater or equal zero" Si $t0 es mayor o igual a cero salta a "etiqueta:" (if ($t0 >= 0))
bgtz $t0,etiqueta # "Greater than zero" Si $t0 es mayor que cero salta a "etiqueta:" (if ($t0 > 0))



# Condiciones booleanas (Guardan 1 si se cumple y 0 si no):


# Con signo:

slt $t0,$t1,$t2 # "Lower than" Si $t1 es menor que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 < $t2))
sle $t0,$t1,$t2 # "Lower or equal" Si $t1 es menor o igual que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 <= $t2))

seq $t0,$t1,$t2 # "Equal" Si $t1 es igual que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 == $t2))
sne $t0,$t1,$t2 # "Not equal" Si $t1 no es igual que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 != $t2))

sge $t0,$t1,$t2 # "Greater or equal" Si $t1 es mayor o igual que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 >= $t2))
sgt $t0,$t1,$t2 # "Greater than" Si $t1 es mayor que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 > $t2))


# Sin signo:

sltu $t0,$t1,$t2 # "Lower than" Si $t1 es menor que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 < $t2))
sleu $t0,$t1,$t2 # "Lower or equal" Si $t1 es menor o igual que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 <= $t2))

seq $t0,$t1,$t2 # "Equal" Si $t1 es igual que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 == $t2))
sne $t0,$t1,$t2 # "Not equal" Si $t1 no es igual que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 != $t2))

sgeu $t0,$t1,$t2 # "Greater or equal" Si $t1 es mayor o igual que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 >= $t2))
sgtu $t0,$t1,$t2 # "Greater than" Si $t1 es mayor que $t2, guarda un 1 en $t0, si no un 0 (if ($t1 > $t2))


# Instrucciones de manipulación de bits con condiciones booleanas:

and $t0,$t1,$t2 # Hace el "AND" bit a bit de $t1 y $t2 y lo almacena en $t0 ($t0 = $t1 & $t2)

or $t0,$t1,$t2 # Hace el "OR" bit a bit de $t1 y $t2 y lo almacena en $t0 ($t0 = $t1 | $t2)

xor $t0,$t1,$t2 # Hace el "XOR" bit a bit de $t1 y $t2 y lo almacena en $t0 ($t0 = $t1 ^ $t2)

not $t0,$t1,$t2 # Hace el "NOR" (invierte todos los bits) de $t1 y $t2 y lo almacena en $t0 ($t0 = ~($t1 | $t2))

not $t0,$t1 # Hace el "NOT" (invierte todos los bits) de $t1 y lo almacena en $t0 ($t0 = ~ $t1)




# Llamadas al sistema:
# Video explicativo 1: https://tuvideo.txs.es/w/hQGPAdpRCu8F9sT957kZWY
# Video explicativo 2: https://tuvideo.txs.es/w/wM7oH8sZodJgS1rHaUu8uM



# Se le dan valores a $v0 para saber que operación queremos hacer:



# Imprimir, tenemos que poner el valor que queramos imprimir en cierto registro específico para que funcione:

li $v0,1 # "Print Int" Le indica al sistema que vamos a imprimir un entero que SIEMPRE se encuentra en $a0.
li $a0,10
syscall

li $v0,2 # "Print float" Le indica al sistema que vamos a imprimir un entero que SIEMPRE se encuentra en $f12.
li $f12,12.4
syscall

li $v0,3 # "Print double" Le indica al sistema que vamos a imprimir un entero que SIEMPRE se encuentra en $f12 y $f13.
li $f12,1213
li $f13,0134
syscall

li $v0,4 # "Print string" Le indica al sistema que vamos a imprimir una cadena de caracteres cuya dirección de memoria SIEMPRE se encuentra en $a0.
la $a0,cadena
syscall

li $v0,11 # "Print char" Le indica al sistema que vamos a imprimir un caracter que SIEMPRE se encuentra en $a0.
li $a0,'a' 
syscall


# Leer, los resultados de la lectura se guardan en unos registros específicos:

li $v0,5 # "Read int" Le indica al sistema que vamos a leer un entero por teclado, dicho entero se guardará en $v0
syscall
move $t0,$v0

li $v0,6 # "Read float" Le indica al sistema que vamos a leer un flotante por teclado, dicho flotante se guardará en $f0
syscall
move $t0,$f0

li $v0,7 # "Read double" Le indica al sistema que vamos a leer un double por teclado, dicho double se guardará en $f0 y $f1
syscall
move $t0,$f0
move $t1,$f1

li $v0,8
syscall
# "Read string" Le indica al sistema que vamos a leer una cadena de caracteres.
# En $a0 se encontrará la dirección de memoria de la cadena (buffer)
# En $a1 se encontrará el número máximo de caracteres admisibles (tamaño del buffer)

li $v0,12 # "Read char" Le indica al sistema que vamos a leer un caracter, dicho caracter se guardará en $v0
syscall
move $t0,$v0


# Finalización del programa:

li $v0,10 # "Exit" Le indica al sistema que nuestro programa ya terminó.
syscall




# Operaciones con flotantes:


# Simple precisión:

add.s $f2,$f4,$f6 # Suma ($f2 = $f4 + $f6)

sub.s $f2,$f4,$f6 # Resta ($f2 = $f4 - $f6)

mul.s $f2,$f4,$f6 # Multiplicación ($f2 = $f4 * $f6)

div.s $f2,$f4,$f6 # División ($f2 = $f4 / $f6)

abs.s $f2,$f4 # Valor absoluto ($f2 = |$f4|)

neg.s $f2,$f4 # Cambio de signo ($f2 = -$f4)


# Doble precisión:

add.d $f2,$f4,$f6 # Suma ($f2 = $f4 + $f6)

sub.d $f2,$f4,$f6 # Resta ($f2 = $f4 - $f6)

mul.d $f2,$f4,$f6 # Multiplicación ($f2 = $f4 * $f6)

div.d $f2,$f4,$f6 # División ($f2 = $f4 / $f6)

abs.d $f2,$f4 # Valor absoluto ($f2 = |$f4|)

neg.d $f2,$f4 # Cambio de signo ($f2 = -$f4)


# Carga y descarga:

lwc1 $f0,etiqueta
l.s $f0,etiqueta # carga en $f0 el valor de etiqueta. Simple precisión ($f0 = etiqueta)

swc1 $f0,etiqueta
s.s $f0,etiqueta # guarda en etiqueta el valor de $f0. Simple precisión (etiqueta = $f0)

ldc1 $f0,etiqueta
l.d $f0,etiqueta # carga en $f0 (y $f1) el valor de etiqueta. Doble precisión ($f0 = etiqueta)

sdc1 $f0,etiqueta
s.d $f0,etiqueta # guarda en etiqueta el valor de $f1 (y $f1). Doble precisión (etiqueta = $f0)

li.s $f0,3.14 # "Load inmidiate" carga 3.14 en el registro $f0. Simple precisión ($f0 = 3.14)

li.d $f0,3.14 # "Load inmidiate" carga 3.14 en el registro $f0 (y $f1). Doble precisión ($f0 = 3.14)

mov.s $f4,$f6 # Mueve el contenido de $f6 y lo pone en $f4. Simple precisión ($f4 = $f6)

mov.d $f4,$f6 # Mueve el contenido de $f6 (y $f7) y lo pone en $f4 (y $f5). Doble precisión ($f4 = $f6)


# Conversiones:

mtc1 $t0,$f0 # Copia de manera "cruda" (bit a bit) el contenido de $t0 en $f0 ($f0 = $t0) CUIDADO PORQUE SE ESCRIBE AL REVÉS

mfc1 $f0,$t0 # Copia de manera "cruda" (bit a bit) el contenido de $f0 en $t0 ($t0 = $f0) CUIDADO PORQUE SE ESCRIBE AL REVÉS

cvt.s.w $f2,$f0 # Pasa el contenido de $f0 (copia de un entero) al registro $f2 (simple precisión) ($f2 = $f0)

cvt.s.d $f2,$f0 # Pasa el contenido de $f0 (doble precisión) al registro $f2 (simple precisión) ($f2 = $f0)

cvt.d.w $f2,$f0 # Pasa el contenido de $f0 (copia de un entero) al registro $f2 (doble precisión) ($f2 = $f0)

cvt.d.s $f2,$f0 # Pasa el contenido de $f0 (simple precisión) al registro $f2 (doble precisión) ($f2 = $f0)

# Formato:

cvt -> convert
s -> simple
d -> double
w -> copia de un entero

# Ejemplo:
cvt.s.d $f0,$f1 # convierte el doble $f1 en un simple y lo guarda en $f0


# Comparaciones:

c.eq.s $f2,$f4 # Si $f2 es igual a $f4 pone cond a 1 (Simple precisión)
c.lt.s $f2,$f4 # Si $f2 es menor que $f4 pone cond a 1 (Simple precisión)
c.le.s $f2,$f4 # Si $f2 es menor o igual que $f4 pone cond a 1 (Simple precisión)

c.eq.d $f2,$f4 # Si $f2 es igual a $f4 pone cond a 1 (Doble precisión)
c.lt.d $f2,$f4 # Si $f2 es menor que $f4 pone cond a 1 (Doble precisión)
c.le.d $f2,$f4 # Si $f2 es menor o igual que $f4 pone cond a 1 (Doble precisión)

# Formato:

c -> cond
eq -> equal
lt -> lower than
le -> lower or equal than
s -> simple
d -> double

# Ejemplo:
c.eq.s $f2,$f4 # Si $f2 es igual a $f4 pone cond a 1 (Simple precisión)

bc1t etiqueta # Si cond es igual a 1 salta a etiqueta ("Branch cond 1 true")
bc1f etiqueta # Si cond es igual a 0 salta a etiqueta ("Branch cond 1 false")

