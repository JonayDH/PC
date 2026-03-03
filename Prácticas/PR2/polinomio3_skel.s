#// Programa para evaluar polinomio tercer grado
#//Realiza un programa en ensamblador MIPS que evalúe un polinomio de tercer 
#//grado de la forma 
#//f(x) = a x^3 + b x^2 + c x + d
#//en un rango de valores enteros [r,s] y devuelva aquellos valores que 
#//son mayores de 2.5
#//El programa debe pedir por consola:
#//- cuatro números flotantes en simple precisión: a, b, c y d
#//- dos números enteros r y s comprobando que r <= s 

# Testear en
# https://codetest.iaas.ull.es/testeaPrinComp/testea/bbad44792ef4f0305d176

# #include <iostream>
# #include <iomanip>

# int main(void) {
#   std::cout << std::fixed << std::setprecision(8);  // Ignorar
#   float a,b,c,d;
#   std::cout << "\nEvaluacion polinomio f(x) = a x^3 + b x^2 + c x + d"
#             << " en un intervalo [r,s]\n";
#   std::cout << "\nIntroduzca coeficiente a: ";
#   std::cin >> a;
#   std::cout << "Introduzca coeficiente b: ";
#   std::cin >> b;
#   std::cout << "Introduzca coeficiente c: ";
#   std::cin >> c;
#   std::cout << "Introduzca coeficiente d: ";
#   std::cin >> d;
#   int r,s;
#   do {
#     std::cout << "\nLímite inferior r: ";
#     std::cin >> r;
#     std::cout << "Límite superior s: ";
#     std::cin >> s;
#   } while (r > s);

#   for (int x = r ; x <= s ; x++) {
#     // float f = x*x*x*a + x*x*b + x*c + d;
#     float f = d;
#     f += x*c;
#     f += x*x*b;
#     f += x*x*x*a;
#    if (f >= 2.5) {
#      std::cout << "f(" << x << ") = " << f;
#    } else {
#      std::cout << x << " no supera";
#    }
#    std::cout << '\n';
#   }
#   std::cout << "\n\nTermina el programa\n";
# }

	.data
strTitulo:	.ascii	"\nEvaluacion polinomio f(x) = a x^3 + b x^2 + c x + d"
		.asciiz	" en un intervalo [r,s]\n"
strIntroA:	.asciiz	"\nIntroduzca coeficiente a: "
strIntroB:	.asciiz	"Introduzca coeficiente b: "
strIntroC:	.asciiz	"Introduzca coeficiente c: "
strIntroD:	.asciiz	"Introduzca coeficiente d: "

strIntroR:	.asciiz	"\nLímite inferior r: "
strIntroS:	.asciiz	"Límite superior s: "

strF:		.asciiz	"f("
strIgual:	.asciiz	") = "
strNoSupera:	.asciiz	" no supera"
strTermina:	.asciiz	"\n\nTermina el programa\n"

	.text

main:

#tabla de registros:
# a -> $f20
# b -> $f22
# c -> $f24
# d -> $f26
# r -> $s0
# s -> $s1
# x -> $s2
# f -> $f28

#   float a,b,c,d;
#   std::cout << "\nEvaluacion polinomio f(x) = a x^3 + b x^2 + c x + d"
#             << " en un intervalo [r,s]\n";
	li $v0, 4
	la $a0, strTitulo
	syscall

#   std::cout << "\nIntroduzca coeficiente a: ";
#   std::cin >> a;

	li $v0,4
	la $a0, strIntroA
	syscall
	
	li $v0,6
	syscall
	mov.s $f20, $f0
	
#   std::cout << "Introduzca coeficiente b: ";
#   std::cin >> b;

	li $v0,4
	la $a0, strIntroB
	syscall
	
	li $v0,6
	syscall
	mov.s $f22, $f0
	
#   std::cout << "Introduzca coeficiente c: ";
#   std::cin >> c;

	li $v0,4
	la $a0, strIntroC
	syscall
	
	li $v0,6
	syscall
	mov.s $f24, $f0
	
#   std::cout << "Introduzca coeficiente d: ";
#   std::cin >> d;

	li $v0,4
	la $a0, strIntroD
	syscall
	
	li $v0,6
	syscall
	mov.s $f26, $f0
	
#   int r,s;

#   do {
#     std::cout << "\nLímite inferior r: ";
#     std::cin >> r;
	do:
		li $v0,4
		la $a0, strIntroR
		syscall
		
		li $v0,5
		syscall
		move $s0,$v0

#     std::cout << "Límite superior s: ";
#     std::cin >> s;

		li $v0,4
		la $a0, strIntroS
		syscall
		
		li $v0,5
		syscall
		move $s1,$v0
		
#   } while (r > s);

	while:
	
		bgt $s0,$s1,do

#   for (int x = r ; x <= s ; x++) {

	move $s2,$s0
	
	for_condicion:
	
		ble $s2,$s1,for_dentro
		b for_fin
	
	for_dentro:
	
#     // float f = x*x*x*a + x*x*b + x*c + d;
#     float f = d;

		mov.s $f28, $f26
	
#     f += x*c;

		move $t0,$s2
	
		mtc1 $t0,$f4
		cvt.s.w $f6,$f4
	
		mul.s $f6,$f6,$f24
		add.s $f28,$f28,$f6
	
#     f += x*x*b;
	
		move $t0,$s2

		mtc1 $t0,$f4
		cvt.s.w $f6,$f4
	
		mul.s $f6,$f6,$f6
		mul.s $f6,$f6,$f22
		add.s $f28,$f28,$f6
	
#     f += x*x*x*a;
	
		move $t0,$s2

		mtc1 $t0,$f4
		cvt.s.w $f6,$f4
	
		mul.s $f8,$f6,$f6
		mul.s $f6,$f6,$f8
		mul.s $f6,$f6,$f20
		add.s $f28,$f28,$f6
	
#    if (f >= 2.5) {
		li.s $f8,2.5
	 
		if_condicion:
	
			c.lt.s $f28,$f8
			bc1f if_dentro
			b if_else

		if_dentro:

#      std::cout << "f(" << x << ") = " << f;
			li $v0,4
			la $a0,strF
			syscall
		
			li $v0,1
			move $a0,$s2
			syscall
		
			li $v0,4
			la $a0,strIgual
			syscall
		
			li $v0,2
			mov.s $f12,$f28
			syscall

			b if_fin
#    } else {

		if_else:
	
#      std::cout << x << " no supera";
			li $v0,1
			move $a0,$s2
			syscall
		
			li $v0,4
			la $a0,strNoSupera
			syscall
#    }
#    std::cout << '\n';
#   }
	if_fin:
	
	li $v0,11
	li $a0,10
	syscall
	
	addi $s2,$s2,1

	b for_condicion
	
	for_fin:
	
#   std::cout << "\n\nTermina el programa\n";
	li $v0,4
	la $a0,strTermina
	syscall
	
	li $v0,10
	syscall

# }
