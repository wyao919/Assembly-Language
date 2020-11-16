;Willy Yao
;Chapter 12 Question 5
;Created 5/30/2020


INCLUDE Irvine32.inc

.data

msg1 BYTE "Enter circle radius: ",0
msg2 BYTE "The area is: ",0
radius REAL8 ?

.code
main PROC

	
	mov	edx, OFFSET msg1					;display message 1
	call WriteString						;call Write String
	call ReadFloat							;read user input as float

	fmul ST(0),ST(0)						;multiply radius * radius

	fldpi									;push pi to stack
	fmul									;multiply st0 and st1
	
	mov	edx,OFFSET msg2						;display message 2
	call WriteString
	
	call WriteFloat							;display area of circle
	call Crlf

	exit
main ENDP

END main