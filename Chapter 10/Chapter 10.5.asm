; Chapter 10 Exercise 5                     (Ex05_ReadInt.asm)

Comment !
Description: Create a macro named mReadInt that reads a 16- or 32-bit
signed integer from standard input and returns the value in an argument.
Use conditional operators to allow the macro to adapt to the size of
the desired result. Write a program that calls the macro, passing it
operands of various sizes. As an extra feature, we display an error
message during assembly if the operand has an unexpected size.
!

INCLUDE Irvine32.inc

mReadInt MACRO intVal
	push eax
	call ReadInt				;; read 32-bit integer
	IF (TYPE intVal) EQ 2		;; store in 16-bit operand?
	  mov intVal,ax
	  	mov	edx,OFFSET str1
		call WriteString
	ELSEIF (TYPE intVal) EQ 4	;; store in 32-bit operand?
	  mov intVal,eax
	ENDIF
	pop eax
ENDM

.data
wVal SWORD 100
dVal SDWORD 1000
str1 BYTE You Input a 16-bit signed integer: ",0
str2 BYTE "Input a 32-bit signed integer: ",0

.code
main PROC

	mReadInt AL

; Input and display a 16-bit signed integer

	mov	edx,OFFSET str1
	call WriteString
	mReadInt wVal
	movsx eax,wVal
	call WriteInt
	call Crlf

; Input and display a 32-bit signed integer

	mov	edx,OFFSET str2
	call WriteString
	mReadInt dVal
	mov  eax,dVal
	call WriteInt
	call Crlf

	exit
main ENDP
END main