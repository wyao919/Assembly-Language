;Willy Yao
;Chapter 12 Question 1
;Created 5/30/2020

INCLUDE Irvine32.inc

.data
X REAL10 2.0
Y REAL10 4.0
msg1 BYTE "X is lower",0dh,0ah,0
msg2 BYTE "X is not lower",0dh,0ah,0


.code
main PROC

	fld x					;push x
	fld y					;push y
	

	fcomi st(0),st(1)		;Compare x and y
	jnb	L1					;jump to L1 if not below
	mov	edx,OFFSET msg2		;else print x is lower
	jmp	L2	

L1:	mov	 edx,OFFSET msg1

L2:	call WriteString

	exit
main ENDP

END main