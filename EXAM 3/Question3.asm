;Willy Yao
;FINAL QUESTION 3
;CREATED 6/4/2020

INCLUDE Irvine32.inc

.data
aV REAL8 273.15
bV REAL8 9.0
cV REAL8 5.0
dV REAL8 32.0
msg1 BYTE "Please enter Kelvin degree to convert: ",0
msg2 BYTE "The temperature converted is: ", 0

.code
main PROC
	call Clrscr
	finit

	mov	edx,OFFSET msg1				;display message
	call WriteString
	call ReadFloat					;ST(0) 
	fsub aV							;ST(0) - 273.15

	fld bV							;load floating point bv 9
	fdiv cV							;divide by 5
			
	fmul st(0), st(1)				;multiply 
	fadd dV							;add 32

	mov	edx,OFFSET msg2				;display message
	call WriteString
	call WriteFloat					;display answqer
	call Crlf

	exit
main ENDP

END main