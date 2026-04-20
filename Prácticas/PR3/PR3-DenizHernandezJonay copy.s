# Principios de computadores Curso 25-26
#
# Autor: Jonay Déniz Hernández
# Fecha de última modificación: 21 de abril de 2026

# // Manejo de matrices con funciones

# #include <iostream>
# #include <iomanip>
# #include <tuple>

# typedef struct {
#   int nFil;
#   int nCol;
#   double elementos[];
# } structMat;


# structMat mat0 {
#   6,
#   6,
#   {
#     11.125, 12.125, 13.125, 14.125, 15.125, 16.125,
#     21.125, 22.125, 23.125, 24.125, 25.375, 26.375,
#     31.375, 32.375, 33.375, 34.375, 35.375, 36.375,
#     41.375, 42.375, 43.375, 44.375, 45.375, 46.375,
#     51.625, 52.625, 53.625, 54.625, 55.625, 56.625,
#     61.625, 62.625, 63.625, 64.625, 65.625, 66.625,

#   }
# };

# structMat mat1 {
#   10,
#   7,
#   {
#     -36.9375, -58.1875, 78.65625, 19.09375, -50.8125, 33.96875, -59.5625,
#     12.34375, 57.28125, -1.96875, -86.8125, -81.8125, 54.59375, -22.5625,
#     88.21875, 64.34375, 52.90625, 47.90625, -83.5625, 19.03125, 4.265625,
#     -31.9375, 82.53125, 27.40625, 56.53125, 39.46875, 18.40625, 97.03125,
#     76.90625, 14.59375, 67.78125, -9.84375, -97.9375, 32.34375, -18.4375,
#     -43.4375, 39.84375, 87.65625, -31.9375, -17.8125, 30.09375, 87.65625,
#     -6.90625, 64.59375, -85.0625, 70.53125, -48.8125, -62.6875, -60.1875,
#     -5.53125, 84.34375, -51.6875, 93.15625, -10.8125, 32.09375, 98.34375,
#     69.46875, 73.84375, 3.734375, 57.21875, -41.5625, -17.4375, -64.1875,
#     -71.3125, -97.9375, 7.109375, -79.0625, 33.84375, 63.53125, -96.1875,

#   }
# };

# structMat mat2 {
#   1,
#   8,
#   {
#     -36.75, 35.375, 79.125, -58.75, -55.25, -19.25, -88.75, -93.75,
#   }
# };

# structMat mat3 {
#   16,
#   1,
#   {
#     -90.75, -65.25, -58.25, -73.25, -89.25, -79.25, 16.875, 66.375,
#     -96.25, -97.25, -24.75, 5.3125, -33.75, -13.25, 27.125, -74.75,

#   }
# };

# structMat mat4 {
#   1,
#   1,
#   { 78.875 }
# };

# structMat mat5 {
#   0,
#   0,
#   { 0 }
# };

# #define NUM_MATRICES  6
# structMat* matrices[NUM_MATRICES]={&mat0, &mat1, &mat2, &mat3, &mat4, &mat5};

# void print_mat(structMat* mat) {
#   int nFil = mat->nFil;
#   int nCol = mat->nCol;
#   double* datos = mat->elementos;
#   std::cout << "\n\nLa matriz tiene dimension " << nFil
#       << 'x' << nCol << '\n';
#   for(int f = 0; f < nFil; f++) {
#     for(int c = 0; c < nCol; c++) {
#       std::cout << datos[f*nCol + c] << ' ';  // datos[f][c]
#     }
#     std::cout << '\n';
#   }
#   std::cout << '\n';
# }

# void change_elto(structMat* mat, int indF, int indC, double valor) {
#   int numCol = mat->nCol;
#   double* datos = mat->elementos;
#   datos[indF * numCol + indC] = valor;  // datos[indF][indC]
# }

# void swap(double* e1, double* e2) {
#   double temp1 = *e1;
#   double temp2 = *e2;
#   *e1 = temp2;
#   *e2 = temp1;
# }

# void intercambia(structMat* mat, int indF, int indC) {
#   int numCol = mat->nCol;
#   int numFil = mat->nFil;
#   double* datos = mat->elementos;
#   // e1 = &(datos[indF][indC]);
#   double* e1 = datos + (indF * numCol + indC);
#   int indFilaOpuesta = (numFil - indF - 1);
#   int indColOpuesta = (numCol - indC - 1);
#   // e1 = &(datos[indFilaOpuesta][indColOpuesta])
#   double* e2 = datos + (indFilaOpuesta * numCol + indColOpuesta);
#   swap(e1, e2);
# }

# void procesa_cols(structMat* mat, int indC1, int indC2) {
#   int numCol = mat->nCol;
#   int numFil = mat->nFil;
#   double* datos = mat->elementos;
#   for(int fa = 0; fa < numFil; fa++) {
#     // e1 = &(datos[fa][indC1]);
#     double* e1 = datos + (fa * numCol + indC1);
#     // e2 = &(datos[fa][indC2]);
#     double* e2 = datos + (fa * numCol + indC2);
#     double val1 = *e1;
#     double val2 = *e2;
#     if(val1 > val2) {
#       *e1 = val1 / 2.0;
#     } else {
#       swap(e1, e2);
#     }
#     *e2 = *e2 + 0.5625;
#   }
# }

# double find_max(structMat* mat) {
#   int numCol = mat->nCol;
#   int numFil = mat->nFil;
#   double* datos = mat->elementos;
#   double max = datos[0];
#   for(int f = 0; f < numFil; f++) {
#     for(int c = 0; c < numCol; c++) {
#       double valor = datos[f * numCol + c];  // datos[f][c]
#       if (valor > max) {
#         max = valor;
#         std::cout << "\nNuevo maximo " << max;
#       }
#     }
#   }
#   return max;
# }

# int leeFila(int numFilas) {
#   int indFil;
#   std::cin >> indFil;
#   if ((indFil < 0) || (indFil >= numFilas)) {
#     std::cout << "Error: Numero de fila incorrecto\n";
#     return -1;
#   }
#   return indFil;
# }

# int leeColumna(int numColumnas) {
#   int indCol;
#   std::cin >> indCol;
#   if ((indCol < 0) || (indCol >= numColumnas)){
#     std::cout << "Error: Numero de columna incorrecto\n";
#     return -1;
#   }
#   return indCol;
# }

# std::tuple<int, int> pideFilaYColumna(structMat* mat) {
#   std::cout << "\nIndice de fila: ";
#   int indFil = leeFila(mat->nFil);
#   if (indFil < 0) {
#     return {-1, -1};
#   }
#   std::cout << "Indice de columna: ";
#   int indCol = leeColumna(mat->nCol);
#   if (indCol < 0) {
#     return {-1, -1};
#   }
#   return {indFil, indCol};
# }

# int main() {
#   std::cout << std::setprecision(18); // Ignorar
#   std::cout << "\nComienza programa manejo matrices con funciones";

#   structMat* matTrabajo = matrices[0];
#   int opcion;
#   do {
#     print_mat(matTrabajo);
#     std::cout <<
#     "(0) Terminar el programa\n"
#     "(1) Cambiar la matriz de trabajo\n"
#     "(3) Cambiar el valor de un elemento\n"
#     "(4) Intercambiar un elemento con su opuesto\n"
#     "(5) Procesa columnas\n"
#     "(7) Encuentra maximo\n"
#     "\nIntroduce opción elegida: ";

#     std::cin >> opcion;

#     int indFil;
#     int indCol;
#     switch (opcion) {
#       // Opción 0 //////////////////////////////////////////////////////////
#       case 0:
#         std::cout << "\nEligida opción de salir";
#         break; // salimos del switch
#       // Opción 1 //////////////////////////////////////////////////////////
#       case 1:
#         std::cout << "\nElije la matriz de trabajo: ";
#         int matT;
#         std::cin >> matT;
#         if ((matT < 0) || (matT >= NUM_MATRICES)) {
#           std::cout << "Numero de matriz de trabajo incorrecto\n";
#           break; // salimos del switch
#         }
#         matTrabajo = matrices[matT];
#         break; // salimos del switch

#       // Opción 3 //////////////////////////////////////////////////////////
#       case 3:
#         std::tie(indFil, indCol) = pideFilaYColumna(matTrabajo);
#         if (indFil < 0)
#           break; // salimos del switch
#         std::cout << "Nuevo valor para el elemento: ";
#         double valor;
#         std::cin >> valor;

#         change_elto(matTrabajo, indFil, indCol, valor);

#         break; // salimos del switch

#       // Opción 4 //////////////////////////////////////////////////////////
#       case 4:
#         std::tie(indFil, indCol) = pideFilaYColumna(matTrabajo);
#         if (indFil < 0)
#           break; // salimos del switch

#         intercambia(matTrabajo, indFil, indCol);

#         break; // salimos del switch

#       // Opción 5 //////////////////////////////////////////////////////////
#       case 5:
#         std::cout << "\nPrimera columna a procesar: ";
#         int indC1;
#         indC1 = leeColumna(matTrabajo->nCol);
#         if (indC1 < 0) {
#           break; // salimos del switch
#         }
#         std::cout << "Segunda columna a procesar: ";
#         int indC2;
#         indC2 = leeColumna(matTrabajo->nCol);
#         if (indC2 < 0) {
#           break;  // salimos del switch
#         }

#         procesa_cols(matTrabajo, indC1, indC2);
#         break;  // salimos del switch

#       // Opción 7 //////////////////////////////////////////////////////////
#       case 7:
#         double maximo;
#         maximo = find_max(matTrabajo);
#         std::cout << "\nEl valor maximo en la matriz es " << maximo;
#         break; // salimos del switch

#       default:
#         // Opción Incorrecta ////////////////////////////////////////////////
#         std::cout << "Error: opcion incorrecta\n";
#     }  // fin del switch
#     std::cout << "\nTerminada la opción " << opcion;
#   } while (opcion != 0);
#   std::cout << "\n\nTermina el programa\n";
# }
    .data
mat0:   .word 6, 6
    .double 11.125, 12.125, 13.125, 14.125, 15.125, 16.125
    .double 21.125, 22.125, 23.125, 24.125, 25.375, 26.375
    .double 31.375, 32.375, 33.375, 34.375, 35.375, 36.375
    .double 41.375, 42.375, 43.375, 44.375, 45.375, 46.375
    .double 51.625, 52.625, 53.625, 54.625, 55.625, 56.625
    .double 61.625, 62.625, 63.625, 64.625, 65.625, 66.625

mat1:   .word 10, 7
    .double -36.9375, -58.1875, 78.65625, 19.09375, -50.8125, 33.96875, -59.5625
    .double 12.34375, 57.28125, -1.96875, -86.8125, -81.8125, 54.59375, -22.5625
    .double 88.21875, 64.34375, 52.90625, 47.90625, -83.5625, 19.03125, 4.265625
    .double -31.9375, 82.53125, 27.40625, 56.53125, 39.46875, 18.40625, 97.03125
    .double 76.90625, 14.59375, 67.78125, -9.84375, -97.9375, 32.34375, -18.4375
    .double -43.4375, 39.84375, 87.65625, -31.9375, -17.8125, 30.09375, 87.65625
    .double -6.90625, 64.59375, -85.0625, 70.53125, -48.8125, -62.6875, -60.1875
    .double -5.53125, 84.34375, -51.6875, 93.15625, -10.8125, 32.09375, 98.34375
    .double 69.46875, 73.84375, 3.734375, 57.21875, -41.5625, -17.4375, -64.1875
    .double -71.3125, -97.9375, 7.109375, -79.0625, 33.84375, 63.53125, -96.1875

mat2:   .word 1, 8
    .double -36.75, 35.375, 79.125, -58.75, -55.25, -19.25, -88.75, -93.75

mat3:   .word 16, 1
    .double -90.75, -65.25, -58.25, -73.25, -89.25, -79.25, 16.875, 66.375
    .double -96.25, -97.25, -24.75, 5.3125, -33.75, -13.25, 27.125, -74.75

mat4:   .word 1, 1
    .double 78.875
mat5:   .word 0, 0
    .double 0.0

# #define NUM_MATRICES  6
NUM_MATRICES = 6
tamD=8  # tamaño de un double en bytes
tamP=4  # tamaño de una palabra (dirección) en bytes
nFil=0  # desplazamiento para acceder a nFil en la estructura
nCol=4  # desplazamiento para acceder a nCol en la estructura
elementos=8  # desplazamiento para acceder a elementos en la estructura
# structMat* matrices[NUM_MATRICES]={&mat0, &mat1, &mat2, &mat3, &mat4, &mat5};
matrices:       .word mat0, mat1, mat2, mat3, mat4, mat5
cadTitulo:      .asciiz "\nComienza programa manejo matrices con funciones"
cadMenu:        .ascii "(0) Terminar el programa\n"
                .ascii "(1) Cambiar la matriz de trabajo\n"
                .ascii "(3) Cambiar el valor de un elemento\n"
                .ascii "(4) Intercambiar un elemento con su opuesto\n"
                .ascii "(5) Procesa columnas\n"
                .ascii "(7) Encuentra maximo\n"
                .asciiz "\nIntroduce opción elegida: ";
cadDim:         .asciiz "\n\nLa matriz tiene dimension "
cadErrorFila:   .asciiz "Error: Numero de fila incorrecto\n"
cadErrorCol:    .asciiz "Error: Numero de columna incorrecto\n"
pideFila:       .asciiz "\nIndice de fila: "
pideCol:        .asciiz "Indice de columna: "
cadNuevoMax:    .asciiz "\nNuevo maximo "
cadSalir:       .asciiz "\nElegida opción de salir"
cadEligeMat:    .asciiz "\nElije la matriz de trabajo: "
cadErrorMat:    .asciiz "Numero de matriz de trabajo incorrecto\n"
cadNuevoValor:  .asciiz "Nuevo valor para el elemento: "
cadTerOpc:      .asciiz "\nTerminada la opción "
cadErrorOpcion: .asciiz "Error: opcion incorrecta\n"
cadPrimCol:     .asciiz "\nPrimera columna a procesar: "
cadSegCol:      .asciiz "Segunda columna a procesar: "
cadMax:         .asciiz "\nEl valor maximo en la matriz es "
cadFin:         .asciiz "\n\nTermina el programa\n"

	.text


# void suma_columnas(structMat* mat, int indC1, int indC2) {
suma_columnas:
# Parámetros de entrada:
# mat -> $a0
# indC1 -> $a1 -> $s0
# indC2 -> $a2 -> $s1
# Parámetros de salida: ninguno
#
# Tabla de registros:
# numFil -> $s2
# numcol -> $s3
# datos -> $s4
# f -> $s5

# Esta función necesita usar la pila
# push: $s0, $s1, $s2, $s3, $s4, $s5
	addi $sp,-24
	sw $s0,0($sp)
	sw $s1,4($sp)
	sw $s2,8($sp)
	sw $s3,12($sp)
	sw $s4,16($sp)
	sw $s5,20($sp)
	
	move $s0,$a1
	move $s1,$a2

#   int numFil = mat->nFil;
	lw $s2,nFil($a0)

#   int numCol = mat->nCol;
	lw $s3,nCol($a0)

#   double* datos = mat->elementos;
	la $s4,elementos($a0)

#   for (int f = 0; f < numFil; f++) {
	li $s5,0

	suma_columnas_for_condicion:

		blt $s5,$s2,suma_columnas_for_dentro
		b suma_columnas_for_fuera

	suma_columnas_for_dentro:

#     // datos[f][indC1] = datos[f][indC1] + datos[f][indC2];
#     datos[f * numCol + indC1] =
#         datos[f * numCol + indC1] 
#    	  + datos[f * numCol + indC2];
		mul $t0,$s5,$s3
		add $t0,$t0,$s0
		mul $t0,$t0,tamD

		add $t0,$t0,$s4
		l.d $f4,0($t0)

		mul $t1,$s5,$s3
		add $t1,$t1,$s1
		mul $t1,$t1,tamD

		add $t1,$t1,$s4
		l.d $f6,0($t1)

		add.d $f4,$f4,$f6
		s.d $f4,0($t0)

		addi $s5,1
		b suma_columnas_for_condicion
#   }
	suma_columnas_for_fuera:

# }

# pop: $s0, $s1, $s2, $s3, $s4, $s5
	lw $s0,0($sp)
	lw $s1,4($sp)
	lw $s2,8($sp)
	lw $s3,12($sp)
	lw $s4,16($sp)
	lw $s5,20($sp)
	addi $sp,24

	jr $ra

suma_columnas__MARCAFIN:


# void print_mat(structMat* mat) {
print_mat:
# Parámetros de entrada:
# mat -> $a0
# Parámetros de salida: ninguno

# Tabla de registros:
# nFil -> $s0
# nCol -> $s1
# datos -> $s2
# f -> $s3
# c -> $s4

# Esta función usa la pila

# Push: $ra, $s0, $s1, $s2, $s3, $s4
	addi $sp,-24
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)

#   int nFil = mat->nFil;
	lw $s0,nFil($a0)

#   int nCol = mat->nCol;
	lw $s1,nCol($a0)

#   double* datos = mat->elementos;
	la $s2,elementos($a0)

#   std::cout << "\n\nLa matriz tiene dimension " << nFil
	li $v0,4
	la $a0,cadDim
	syscall

	li $v0,1
	move $a0,$s0
	syscall

#       << 'x' << nCol << '\n';
	li $v0,11
	li $a0,'x'
	syscall

	li $v0,1
	move $a0,$s1
	syscall

	li $v0,11
	li $a0,'\n'
	syscall

#   for(int f = 0; f < nFil; f++) {
	li $s3,0
	print_mat_for_condicion:

		blt $s3,$s0,print_mat_for_dentro
		b print_mat_for_fuera

	print_mat_for_dentro:
#     for(int c = 0; c < nCol; c++) {
		li $s4,0
		print_mat_for2_condicion:

			blt $s4,$s1,print_mat_for2_dentro
			b print_mat_for2_fuera

		print_mat_for2_dentro:

#       std::cout << datos[f*nCol + c] << ' ';  // datos[f][c]
			mul $t1,$s3,$s1
			add $t1,$t1,$s4
			mul $t1,$t1,tamD
			add $t1,$t1,$s2

			li $v0,3
			l.d $f12,0($t1)
			syscall

			li $v0,11
			li $a0,' '
			syscall

			addi $s4,1
			b print_mat_for2_condicion
#     }
		print_mat_for2_fuera:
#     std::cout << '\n';
		li $v0,11
		li $a0,'\n'
		syscall

		addi $s3,1
		b print_mat_for_condicion
#   }
	print_mat_for_fuera:
#   std::cout << '\n';
	li $v0,11
	li $a0,'\n'
	syscall
# }

# Pop:
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $s4,20($sp)
	addi $sp,24

	jr $ra

print_mat__MARCAFIN:



# void change_elto(structMat* mat, int indF, int indC, double valor) {
change_elto:
# Parámetros de entrada:
# mat -> $a0
# indF -> $a1
# indC -> $a2
# valor -> $f12
# Parámetros de salida: ninguno

# Tabla de registros:
# numCol -> $t0
# datos -> $t1

#   int numCol = mat->nCol;
	lw $t0,nCol($a0)

#   double* datos = mat->elementos;
	la $t1,elementos($a0)

#   datos[indF * numCol + indC] = valor;  // datos[indF][indC]
	mul $t2,$t0,$a1
	add $t2,$t2,$a2
	mul $t2,$t2,tamD
	add $t2,$t2,$t1
	s.d $f12,0($t2)

# }
	jr $ra

change_elto__MARCAFIN:



# void swap(double* e1, double* e2) {
swap:
# Parámetros de entrada:
# e1 -> $a0
# e2 -> $a1
# Parámetros de salida: ninguno

# Tabla de registros:
# temp1 -> $f4
# temp2 -> $f6

#   double temp1 = *e1;
	l.d $f4,0($a0)

#   double temp2 = *e2;
	l.d $f6,0($a1)

#   *e1 = temp2;
	s.d $f6,0($a0)

#   *e2 = temp1;
	s.d $f4,0($a1)

# }
	jr $ra

swap__MARCAFIN:



# void intercambia(structMat* mat, int indF, int indC) {
intercambia:
# Parámetros de entrada:
# mat -> $a0
# indF -> $a1
# indC -> $a2
# Parámetros de salida: ninguno

# Tabla de registros:
# numCol -> $t0
# numFil -> $t1
# datos -> $t2
# e1 -> $t3
# indFilaOpuesta -> $t4
# indColOpuesta -> $t5
# e2 -> $t6

# Esta función necesita usar la pila:
# push: $ra
	addi $sp,-4
	sw $ra,0($sp)

#   int numCol = mat->nCol;
	lw $t0,nCol($a0)

#   int numFil = mat->nFil;
	lw $t1,nFil($a0)

#   double* datos = mat->elementos;
	la $t2,elementos($a0)

#   // e1 = &(datos[indF][indC]);
#   double* e1 = datos + (indF * numCol + indC);
	mul $t3,$a1,$t0
	add $t3,$t3,$a2
	mul $t3,$t3,tamD
	add $t3,$t3,$t2

#   int indFilaOpuesta = (numFil - indF - 1);
	sub $t4,$t1,$a1
	addi $t4,-1

#   int indColOpuesta = (numCol - indC - 1);
	sub $t5,$t0,$a2
	addi $t5,-1

#   // e1 = &(datos[indFilaOpuesta][indColOpuesta])
#   double* e2 = datos + (indFilaOpuesta * numCol + indColOpuesta);
	mul $t6,$t4,$t0
	add $t6,$t6,$t5
	mul $t6,$t6,tamD
	add $t6,$t6,$t2

#   swap(e1, e2);
	move $a0,$t3
	move $a1,$t6
	jal swap
# }

# pop:
	lw $ra,0($sp)
	addi $sp,4

	jr $ra

intercambia__MARCAFIN:



# void procesa_cols(structMat* mat, int indC1, int indC2) {
procesa_cols:
# Parámetros de entrada:
# mat -> $a0 ->
# indC1 -> $a1 -> $s6
# indC2 -> $a2 -> $s7
# Parámetros de salida: ninguno

# tabla de registros:
# numCol -> $s0
# numFil -> $s1
# datos -> $s2
# fa -> $s3
# e1 -> $s4
# e2 -> $s5
# val1 -> $f20
# val2 -> $f22

# Esta función necesita usar la pila
# push: $ra, $s0, $s1, $s2, $s3, $s4, $s5, $f20, $f22, $s6, $s7
	addi $sp,-52
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)
	sw $s5,24($sp)
	s.d $f20,28($sp)
	s.d $f22,36($sp)
	sw $s6,44($sp)
	sw $s7,48($sp)

	move $s6,$a1
	move $s7,$a2

#   int numCol = mat->nCol;
	lw $s0,nCol($a0)

#   int numFil = mat->nFil;
	lw $s1,nFil($a0)

#   double* datos = mat->elementos;
	la $s2,elementos($a0)

#   for(int fa = 0; fa < numFil; fa++) {
	li $s3,0
	procesa_cols_for_condicion:

		blt $s3,$s1,procesa_cols_for_dentro
		b procesa_cols_for_fuera

	procesa_cols_for_dentro:

#     // e1 = &(datos[fa][indC1]);
#     double* e1 = datos + (fa * numCol + indC1);
		mul $s4,$s3,$s0
		add $s4,$s4,$s6
		mul $s4,$s4,tamD
		add $s4,$s4,$s2

#     // e2 = &(datos[fa][indC2]);
#     double* e2 = datos + (fa * numCol + indC2);
		mul $s5,$s3,$s0
		add $s5,$s5,$s7
		mul $s5,$s5,tamD
		add $s5,$s5,$s2

#     double val1 = *e1;
		l.d $f20,0($s4)

#     double val2 = *e2;
		l.d $f22,0($s5)

#     if(val1 > val2) {
		procesa_cols_if_condicion:

			c.le.d $f20,$f22
			bc1f procesa_cols_if_dentro
			b procesa_cols_if_else

		procesa_cols_if_dentro:

#       *e1 = val1 / 2.0;
			li.d $f4,2.0
			div.d $f4,$f20,$f4
			s.d $f4,0($s4)

			b procesa_cols_if_fin
#     } else {
		procesa_cols_if_else:

#       swap(e1, e2);
			move $a0,$s4
			move $a1,$s5

			jal swap
#     }
		procesa_cols_if_fin:

#     *e2 = *e2 + 0.5625;
		li.d $f6,0.5625
		l.d $f8,0($s5)
		add.d $f6,$f8,$f6
		s.d $f6,0($s5)

		addi $s3,1
		b procesa_cols_for_condicion

	procesa_cols_for_fuera:
#   }
# }

# pop:
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $s4,20($sp)
	lw $s5,24($sp)
	l.d $f20,28($sp)
	l.d $f22,36($sp)
	lw $s6,44($sp)
	lw $s7,48($sp)
	addi $sp,52

	jr $ra

procesa_cols__MARCAFIN:



# double find_max(structMat* mat) {
find_max:
# Parámetros de entrada:
# mat -> $a0
# Parámetros de salida:
# max -> $f0

# Tabla de registros:
# numCol -> $s0
# numFil -> $s1
# datos -> $s2
# max -> $f20
# f -> $s3
# c -> $s4
# valor -> $f22

# Esta función necesita usar la pila:
# Push: $ra, $s0, $s1, $s2, $s3, $s4, $f20, $f22
	addi $sp,-40
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)
	sw $s3,16($sp)
	sw $s4,20($sp)
	s.d $f20,24($sp)
	s.d $f22,32($sp)

#   int numCol = mat->nCol;
	lw $s0,nCol($a0)

#   int numFil = mat->nFil;
	lw $s1,nFil($a0)

#   double* datos = mat->elementos;
	la $s2,elementos($a0)

#   double max = datos[0];
	l.d $f20,0($s2)

#   for(int f = 0; f < numFil; f++) {
	li $s3,0
	find_max_for_condicion:

		blt $s3,$s1,find_max_for_dentro
		b find_max_for_fuera

	find_max_for_dentro:

#     for(int c = 0; c < numCol; c++) {
		li $s4,0
		find_max_for2_condicion:

			blt $s4,$s0,find_max_for2_dentro
			b find_max_for2_fuera

		find_max_for2_dentro:

#       double valor = datos[f * numCol + c];  // datos[f][c]
			li $t0,0

			mul $t0,$s3,$s0
			add $t0,$t0,$s4
			mul $t0,$t0,tamD
			add $t0,$t0,$s2

			l.d $f22,0($t0)

#       if (valor > max) {
			find_max_if_condicion:

				c.le.d $f22,$f20
				bc1f find_max_if_dentro
				b find_max_if_fuera

			find_max_if_dentro:

#         max = valor;
				mov.d $f20,$f22

#         std::cout << "\nNuevo maximo " << max;
				li $v0,4
				la $a0,cadNuevoMax
				syscall

				li $v0,3
				mov.d $f12,$f20
				syscall
#       }
			find_max_if_fuera:

			addi $s4,1
			b find_max_for2_condicion
#     }
		find_max_for2_fuera:

		addi $s3,1
		b find_max_for_condicion

	find_max_for_fuera:
#   }
#   return max;
	mov.d $f0,$f20	
# }

# Pop: $ra, $s0, $s1, $s2, $s3, $s4, $f20, $f22
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	lw $s3,16($sp)
	lw $s4,20($sp)
	l.d $f20,24($sp)
	l.d $f22,32($sp)
	addi $sp,40

	jr $ra

find_max__MARCAFIN:



# int leeFila(int numFilas) {
leeFila:
# Parámetros de entrada:
# numFilas -> $a0 -> $s0
# Parámetros de salida:
# indFil -> $v0

# Tabla de registros:
# indFil -> $s1

# Esta función necesita usar la pila

# push: $ra, $s0, $s1
	addi $sp,-12
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)

	move $s0,$a0
#   int indFil;
#   std::cin >> indFil;
	li $v0,5
	syscall
	move $s1,$v0

#   if ((indFil < 0) || (indFil >= numFilas)) {
	leeFila_if_condicion:

		blt $s1,$zero,leeFila_if_dentro
		bge $s1,$s0,leeFila_if_dentro
		b leeFila_if_fuera

	leeFila_if_dentro:

#     std::cout << "Error: Numero de fila incorrecto\n";
		li $v0,4
		la $a0,cadErrorFila
		syscall

#     return -1;
		li $v0,-1

# pop:
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		addi $sp,12

		jr $ra
#   }
	leeFila_if_fuera:

#   return indFil;
	move $v0,$s1

# }
# pop:
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addi $sp,12

	jr $ra

leeFila__MARCAFIN:



# int leeColumna(int numColumnas) {
leeColumna:
# Parámetros de entrada:
# numColumnas -> $a0 -> $s0
# Parámetros de salida:
# indCol -> $v0

# Tabla de registros:
# indCol -> $s1

# Esta función necesita usar la pila:
# push: $ra, $s0, $s1
	addi $sp,-12
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)

	move $s0,$a0
#   int indCol;
#   std::cin >> indCol;
	li $v0,5
	syscall
	move $s1,$v0

#   if ((indCol < 0) || (indCol >= numColumnas)){
	leeColumna_if_condicion:

		blt $s1,$zero,leeColumna_if_dentro
		bge $s1,$s0,leeColumna_if_dentro
		b leeColumna_if_fuera

	leeColumna_if_dentro:

#     std::cout << "Error: Numero de columna incorrecto\n";
		li $v0,4
		la $a0,cadErrorCol
		syscall

#     return -1;
		li $v0,-1

# pop:
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		addi $sp,12

		jr $ra

#   }
	leeColumna_if_fuera:

#   return indCol;
	move $v0,$s1
# }

# pop:
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	addi $sp,12

	jr $ra

leeColumna__MARCAFIN:



# std::tuple<int, int> pideFilaYColumna(structMat* mat) {
pideFilaYColumna:
# Parámetros de entrada:
# mat -> $a0 -> $s0
# Parámetros de salida:
# indFil -> $v0
# indCol -> $v1

# Tabla de registros:
# indFil -> $s1
# indCol -> $s2

# Esta función necesita usar la pila:
# push: $ra, $s0, $s1, $s2
	addi $sp,-16
	sw $ra,0($sp)
	sw $s0,4($sp)
	sw $s1,8($sp)
	sw $s2,12($sp)

	move $s0,$a0

#   std::cout << "\nIndice de fila: ";
	li $v0,4
	la $a0,pideFila
	syscall

#   int indFil = leeFila(mat->nFil);
	lw $a0,nFil($s0)
	jal leeFila
	move $s1,$v0

#   if (indFil < 0) {
	pideFilaYColumna_if_condicion:

		blt $s1,$zero,pideFilaYColumna_if_dentro
		b pideFilaYColumna_if_fuera

	pideFilaYColumna_if_dentro:

#     return {-1, -1};
		li $v0,-1
		li $v1,-1

# pop: $ra, $s0, $s1, $s2
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		lw $s2,12($sp)
		addi $sp,16

		jr $ra
#   }
	pideFilaYColumna_if_fuera:

#   std::cout << "Indice de columna: ";
	li $v0,4
	la $a0,pideCol
	syscall

#   int indCol = leeColumna(mat->nCol);
	lw $a0,nCol($s0)
	jal leeColumna
	move $s2,$v0

#   if (indCol < 0) {
	pideFilaYColumna_if2_condicion:

		blt $s2,$zero,pideFilaYColumna_if2_dentro
		b pideFilaYColumna_if2_fuera

	pideFilaYColumna_if2_dentro:

#     return {-1, -1};
		li $v0,-1
		li $v1,-1

# pop: $ra, $s0, $s1, $s2
		lw $ra,0($sp)
		lw $s0,4($sp)
		lw $s1,8($sp)
		lw $s2,12($sp)
		addi $sp,16

		jr $ra

#   }
	pideFilaYColumna_if2_fuera:

#   return {indFil, indCol};
	move $v0,$s1
	move $v1,$s2
# }

# pop: $ra, $s0, $s1, $s2
	lw $ra,0($sp)
	lw $s0,4($sp)
	lw $s1,8($sp)
	lw $s2,12($sp)
	addi $sp,16

	jr $ra

pideFilaYColumna__MARCAFIN:



# int main() {
main:
# Tabla de registros:
# matTrabajo -> $s0
# opcion -> $s1
# matT -> $t0
# indFil -> $s3
# indCol -> $s4
# valor -> $f20
# indC1 -> $s5
# indC2 -> $s6
# maximo -> $f22

#   std::cout << std::setprecision(18); // Ignorar
#   std::cout << "\nComienza programa manejo matrices con funciones";
	li $v0,4
	la $a0,cadTitulo
	syscall

#   structMat* matTrabajo = matrices[0];
	lw $s0,matrices


#   int opcion;
#   do {
	do:

#     print_mat(matTrabajo);
		move $a0,$s0
		jal print_mat

#     std::cout <<
#     "(0) Terminar el programa\n"
#     "(1) Cambiar la matriz de trabajo\n"
#     "(3) Cambiar el valor de un elemento\n"
#     "(4) Intercambiar un elemento con su opuesto\n"
#     "(5) Procesa columnas\n"
#     "(7) Encuentra maximo\n"
#     "\nIntroduce opción elegida: ";
		li $v0,4
		la $a0,cadMenu
		syscall

#     std::cin >> opcion;
		li $v0,5
		syscall
		move $s1,$v0

#     int indFil;
#     int indCol;
#     switch (opcion) {
		switch:

			beq $s1,0,switch_case0
			beq $s1,1,switch_case1
			beq $s1,2,switch_case2
			beq $s1,3,switch_case3
			beq $s1,4,switch_case4
			beq $s1,5,switch_case5
			beq $s1,7,switch_case7
			b switch_default
			
#       // Opción 0 //////////////////////////////////////////////////////////
#       case 0:
		switch_case0:

#         std::cout << "\nEligida opción de salir";
			li $v0,4
			la $a0,cadSalir
			syscall

#         break; // salimos del switch
			b switch_break

#       // Opción 1 //////////////////////////////////////////////////////////
#       case 1:
		switch_case1:

#         std::cout << "\nElije la matriz de trabajo: ";
			li $v0,4
			la $a0,cadEligeMat
			syscall

#         int matT;
#         std::cin >> matT;
			li $v0,5
			syscall
			move $t0,$v0

#         if ((matT < 0) || (matT >= NUM_MATRICES)) {
			if_switch_case1_condicion:

				blt $t0,0,if_switch_case1_dentro
				bge $t0,NUM_MATRICES,if_switch_case1_dentro
				b if_switch_case1_fuera

			if_switch_case1_dentro:

#           std::cout << "Numero de matriz de trabajo incorrecto\n";
				li $v0,4
				la $a0,cadErrorMat
				syscall

#           break; // salimos del switch
				b switch_break
#         }
			if_switch_case1_fuera:

#         matTrabajo = matrices[matT];
			la $t1,matrices
			mul $t2,$t0,tamP
			add $t2,$t2,$t1
			lw $s0,0($t2)

#         break; // salimos del switch
			b switch_break

		switch_case2:

			move $a0,$s0
			jal leeColumna
			move $s7,$v0

			move $a0,$s0
			jal leeColumna
			move $s8,$v0

			move $a0,$s0
			move $a1,$s7
			move $a2,$s8
			jal suma_columnas

			b switch_break

#       // Opción 3 //////////////////////////////////////////////////////////
#       case 3:
		switch_case3:

#         std::tie(indFil, indCol) = pideFilaYColumna(matTrabajo);
			move $a0,$s0
			jal pideFilaYColumna

			move $s3,$v0
			move $s4,$v1

#         if (indFil < 0)
			if_switch_case3_condicion:

				blt $s3,$zero,if_switch_case3_dentro
				b if_switch_case3_fuera

			if_switch_case3_dentro:

#           break; // salimos del switch
				b switch_break

			if_switch_case3_fuera:

#         std::cout << "Nuevo valor para el elemento: ";
			li $v0,4
			la $a0,cadNuevoValor
			syscall

#         double valor;
#         std::cin >> valor;
			li $v0,7
			syscall
			mov.d $f20,$f0

#         change_elto(matTrabajo, indFil, indCol, valor);
			move $a0,$s0
			move $a1,$s3
			move $a2,$s4
			mov.d $f12,$f20
			jal change_elto

#         break; // salimos del switch
			b switch_break

#       // Opción 4 //////////////////////////////////////////////////////////
#       case 4:
		switch_case4:

#         std::tie(indFil, indCol) = pideFilaYColumna(matTrabajo);
			move $a0,$s0
			jal pideFilaYColumna

			move $s3,$v0
			move $s4,$v1

#         if (indFil < 0)
			if_switch_case4_condicion:

				blt $s3,$zero,if_switch_case4_dentro
				b if_switch_case4_fuera

			if_switch_case4_dentro:

#           break; // salimos del switch
				b switch_break

			if_switch_case4_fuera:

#         intercambia(matTrabajo, indFil, indCol);
			move $a0,$s0
			move $a1,$s3
			move $a2,$s4

			jal intercambia

#         break; // salimos del switch
			b switch_break

#       // Opción 5 //////////////////////////////////////////////////////////
#       case 5:
		switch_case5:

#         std::cout << "\nPrimera columna a procesar: ";
			li $v0,4
			la $a0,cadPrimCol
			syscall

#         int indC1;
#         indC1 = leeColumna(matTrabajo->nCol);
			lw $t1,nCol($s0)
			move $a0,$t1
			jal leeColumna

			move $s5,$v0

#         if (indC1 < 0) {
			if_switch_case5_condicion:

				blt $s5,$zero,if_switch_case5_dentro
				b if_switch_case5_fuera

			if_switch_case5_dentro:

#           break; // salimos del switch
				b switch_break

#         }
			if_switch_case5_fuera:

#         std::cout << "Segunda columna a procesar: ";
			li $v0,4
			la $a0,cadSegCol
			syscall

#         int indC2;
#         indC2 = leeColumna(matTrabajo->nCol);
			lw $t1,nCol($s0)
			move $a0,$t1
			jal leeColumna

			move $s6,$v0

#         if (indC2 < 0) {
			if2_switch_case5_condicion:

				blt $s6,$zero,if2_switch_case5_dentro
				b if2_switch_case5_fuera

			if2_switch_case5_dentro:

#           break;  // salimos del switch
				b switch_break

#         }
			if2_switch_case5_fuera:

#         procesa_cols(matTrabajo, indC1, indC2);
			move $a0,$s0
			move $a1,$s5
			move $a2,$s6

			jal procesa_cols

#         break;  // salimos del switch
			b switch_break

#       // Opción 7 //////////////////////////////////////////////////////////
#       case 7:
		switch_case7:

#         double maximo;
#         maximo = find_max(matTrabajo);
			move $a0,$s0

			jal find_max

			mov.d $f22,$f0

#         std::cout << "\nEl valor maximo en la matriz es " << maximo;
			li $v0,4
			la $a0,cadMax
			syscall

			li $v0,3
			mov.d $f12,$f22
			syscall

#         break; // salimos del switch
			b switch_break

#       default:
		switch_default:

#         // Opción Incorrecta ////////////////////////////////////////////////
#         std::cout << "Error: opcion incorrecta\n";
			li $v0,4
			la $a0,cadErrorOpcion
			syscall

#     }  // fin del switch
		switch_break:

#     std::cout << "\nTerminada la opción " << opcion;
		li $v0,4
		la $a0,cadTerOpc
		syscall

		li $v0,1
		move $a0,$s1
		syscall

#   } while (opcion != 0);
	do_while:

		bne $s1,$zero,do

	do_fin:

#   std::cout << "\n\nTermina el programa\n";
	li $v0,4
	la $a0,cadFin
	syscall
# }

	li $v0,10
	syscall