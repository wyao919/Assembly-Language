;Willy Yao
;Chapter 12 Question 4
;Created 5/30/2020

INCLUDE Irvine32.inc

.data

valueA REAL8 7.0
valueB REAL8 5.0
valueC REAL8 3.0
valueD REAL8 4.0
valueE REAL8 2.0

.code
main PROC

	fld	valueB							;COPY B to FPU STACK
	fadd valueA							;ADD A + B
	fdiv valueC	                        ;Divide C
	fld	valueD							;Copy D to FPU stack
	fsub valueA							;subtract value A
	fadd valueE							;Add Value E

	call ShowFPUStack					;show FPU stack to check if correct

	fmul								;multiply left side with right side 
	call Crlf							
	call WriteFloat						;show answer
	call Crlf
	call Crlf
	
	exit
main ENDP

END main