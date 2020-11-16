;Willy Yao
;Chapter 12 Question 6
;Created 6/1/2020

INCLUDE Irvine32.inc

.data

msgA BYTE "Input coefficient A: ",0
msgB BYTE "Input coefficient B: ",0
msgC BYTE "Input coefficient C: ",0
msgI BYTE "imaginary root", 0
msg1 BYTE "Root 1: ",0
msg2 BYTE "Root 2: ",0

radius REAL8 ?
num2 REAL8 2.0
num4 REAL8 4.0
num0 REAL8 0.0
junk REAL8 0.0

coeffA	REAL8 ?
coeffB	REAL8 ?
coeffC	REAL8 ?



firstPart REAL8 ?		; sqrt( B^ - 4AC )

.code
main PROC

	call Clrscr
	finit

	mov	edx,OFFSET msgA							;collect input A
	call WriteString							
	call ReadFloat		
	fstp coeffA

	mov	edx,OFFSET msgB							;collect input b
	call WriteString
	call ReadFloat		
	fstp coeffB

	mov	edx,OFFSET msgC							;collect input c
	call WriteString
	call ReadFloat		
	fstp coeffC
	
	fld	coeffB									;load coefficient B into FPU stack
	fmul ST(0),ST(0)							;Square it
	fld	num4									;load 4 into FPU stack
	fmul coeffA									;multiply coefficient A
	fmul coeffC									;multiply coefficient C
	fsub										;subtract it. Will store into ST(0)
	
	fld	num0									;load fpu stack with 0	
	fcomi ST(0),ST(1)							;compare and check if 0								
	ja imaginary								;imaginary root if above
									
	fstp junk									;pop the zero value
	fsqrt										;square root of ST(0)
	fst	firstPart								;store first part
	
	fld	coeffB									;load coefficient B
	fchs										;change the sign
	fadd firstPart								;add the first part
	
	fld	coeffA									;load coefficient a		
	fmul num2									;mulitply it by 2
	
	fdivp ST(1),ST(0)							;divide

	mov	edx,OFFSET msg1							;display root1
	call WriteString
	call WriteFloat
	call Crlf
	
	
	fld	coeffB									;load coeffeciient B
	fchs										;change the sign
	fsub firstPart								;subtract b with the first part
	
	fld	coeffA									;load coefficient a	
	fmul num2									;mulitply by 2
	
	fdivp ST(1),ST(0)							;divide

	mov	edx,OFFSET msg2							;diplay root 2
	call WriteString
	call WriteFloat
	call Crlf
	jmp	finish									;exit when done skip imaginary

imaginary:
	call crlf
	mov	edx,OFFSET msgI							;display imaginary message
	call WriteString

finish:

	exit
main ENDP

END main