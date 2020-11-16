;Willy Yao
;Date 5/29/2020
;Chapter 10 Question 6

INCLUDE Irvine32.inc

mWriteInt MACRO intVal
	push eax
	IF (TYPE intVal) EQ 1		;check if 8 bit
	  movsx eax,intVal			;display byte 
	  call  WriteInt

	ELSEIF (TYPE intVal) EQ 2	;check if 16 bit
	  movsx eax,intVal			;display word
	  call  WriteInt

	ELSEIF (TYPE intVal) EQ 4	;check if 32 bit operand
	  mov  eax,intVal			;display double word
	  call WriteInt
	
	ENDIF
	pop eax
ENDM

.data
byteVal SBYTE -123
wordVal SWORD -234
doubleVal SDWORD +09183


.code
main PROC

	mWriteInt byteVal				;call macro
	call Crlf

	mWriteInt wordVal				;call macro
	call Crlf

	mWriteInt doubleVal				;call macro
	call Crlf

	exit
main ENDP
END main