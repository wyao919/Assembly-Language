;Willy Yao
;Chapter 9 Question 12
;Created 5/29/2020


INCLUDE Irvine32.inc

.data

index DWORD ?

byteTable BYTE  5,10,15,20,25
byteTableSize = ($ - byteTable)
          BYTE  30,35,40,45,50
          BYTE  50,55,60,65,70

wordTable WORD   5,10,15,20,25
wordRowSize = ($ - wordTable)
	      WORD  30,35,40,45,50
          WORD  50,55,60,65,70

doubleTable DWORD  5,10,15,20,25
doubleRowSize = ($ - doubleTable)
            DWORD  30,35,40,45,50
            DWORD  50,55,60,65,70



msg1 BYTE "Enter row number: ",0
msg2 BYTE "Sum =  ",0

.code
main PROC

	mov	edx,OFFSET msg1					;display message 1
	call WriteString					
	call Readint						;collect user input to eax and mov to index
	mov	index, eax						
										;Byte Table
	push OFFSET byteTable				;move offset byte table
	push DWORD PTR byteTableSize		;row size type
	push TYPE BYTE						;push array type
	push index							;push index
	call calc_row_sum					;call proc

	mov	edx,OFFSET msg2					;Display message 2
	call WriteString
	call WriteDec						;write sum
	call Crlf							;next line

										;Word Table
	push OFFSET wordTable				;move offset Word table
	push DWORD PTR wordRowSize			;row size type
	push TYPE BYTE						;push array type
	push index							;push index
	call calc_row_sum					;call proc

	mov	edx,OFFSET msg2					;Display message 2
	call WriteString
	call WriteDec						;write sum
	call Crlf							;next line

										;Double word table
	push OFFSET doubleTable				;move offset Double table
	push DWORD PTR doubleRowSize		;row size type
	push TYPE BYTE						;push array type
	push index							;push index
	call calc_row_sum					;call proc

	mov	edx,OFFSET msg2					;Display message 2
	call WriteString
	call WriteDec						;write sum
	call Crlf							;next line

	exit
main ENDP

;------------------------------------------------------------
calc_row_sum PROC
;Calculates the sum of the rows in a double array
;------------------------------------------------------------


rowindex EQU DWORD PTR [ebp+8]						
arrayType EQU DWORD PTR [ebp+12]
rowSize EQU DWORD PTR [ebp+16]
arrayOffset EQU DWORD PTR [ebp+20]




	push ebp								;push base pointer
	mov	ebp, esp							;move stack pointer to base pointer

	mov	eax, rowIndex						;mov rowindex to eax
	mul	DWORD PTR rowSize					;multiple dword PTR rowsize
	mov	ebx, arrayOffset					;mov arrayOffset to ebx
	add	ebx,eax								


	mov	ecx,rowSize							;loop counter for row size

	.IF arrayType == 2
		shr	ecx, 1
	.ELSEIF arrayType == 4
		shr	ecx, 2
	.ENDIF
	
	mov	eax, 0				
	mov	esi, 0				


L1:													;check the type using IF statement
	.IF arrayType == 1
		 movzx edx,BYTE PTR[ebx + esi]				;if Byte get byte
	.ELSEIF arrayType == 2
		movzx edx,WORD PTR[ebx + esi*2]				;if word get word
	.ELSEIF arrayType == 4
		 mov  edx,DWORD PTR[ebx + esi*4]			;if doubleword get doubleword
	.ENDIF

	add	eax,edx					;increase accumulator
	inc	esi						;move to next value
	loop L1

	pop	ebp						;pop ebp

	ret	20
calc_row_sum ENDP

END main