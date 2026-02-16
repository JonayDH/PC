# Convenio de registros:

$v0 / $v1 -> Sirven para devolver valores de funciones

$a0 - $a3 -> Argumentos de la función

$t0 - $t9 -> Temporales (se borran con un syscall o llamadas a funciones)

$s0 - $s7 -> Salvados (no se borran con un syscall o llamadas a funciones)

# COnvenio de registros (flotantes):

# Importante: si queremos representar un double siempre tomaron un registro y el siguiente
# Es decir: $f0 y $f1, $f1 y $f2 ...

$f0 - $f2 -> Sirven para devolver valores de funciones

$f4 - $f10 -> Registros temporales (se borran con un syscall o llamadas a funciones)
$f16 - $f18 -> Registros temporales (se borran con un syscall o llamadas a fucniones)

$f12 - $f14 -> Argumentos de la función

$f20 - $f30 -> Registros salvados (no se borran con un syscall o llamadas a funciones)