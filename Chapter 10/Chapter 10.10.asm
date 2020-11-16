;Willy Yao
;Date 5/29/2020
;Chapter 10 Question 10

INCLUDE Irvine32.inc

add3 MACRO dest, source1, source2				;addition macro

	mov	eax,source1
	add	eax,source2
	mov	dest,eax								;move answer to destination
ENDM

sub3 MACRO dest, source1, source2				;subtraction macro

	mov	eax,source1
	sub	eax,source2
	mov	dest,eax								;move answer to destination
ENDM


mul3 MACRO dest, source1, source2				;multiplication macro

	mov	eax,source1
	imul source2
	mov	dest,eax								;move answer to destination			
ENDM


div3 MACRO dest, source1, source2				;division macro
	mov	eax,source1
	cdq
	idiv source2
	mov	dest, eax								;move answer to destination
ENDM

.data
w SDWORD 4
x SDWORD 5
y SDWORD 6
z SDWORD -7
temp SDWORD ?
temp2 SDWORD ?

.code
main PROC

	
	add3 temp, w, y					;temp = w + y

	sub3 temp, x, y					;temp = x - y

	mul3 temp, x, y					;temp = x * y

	div3 temp2, z, x				;temp2 = z / x

	mul3 x, temp, z

	
	exit
main ENDP

END main 