;Boolean Calculator (1)
;Create a program that functions as a simple boolean calculator for 32-bit integers. It should display
;a menu that asks the user to make a selection from the following list:
;1. x AND y
;2. x OR y
;3. NOT x
;4. x XOR y
;5. Exit program
;When the user makes a choice, call a procedure that displays the name of the operation about to
;be performed. You must implement this procedure using the Table-Driven Selection technique,
;shown in Section 6.5.4. (You will implement the operations in Exercise 6.) (The Irvine32 library
;is required for this solution program.)

INCLUDE Irvine32.inc

.data
msgMenu BYTE "Boolean Calculator"
	BYTE 0dh, 0ah													;0dh and 0ah will jump to the next line
	BYTE "1. x AND y"     ,0dh,0ah
	BYTE "2. x OR y"      ,0dh,0ah
	BYTE "3. NOT x"       ,0dh,0ah
	BYTE "4. x XOR y"     ,0dh,0ah
	BYTE "5. Exit program", 0

msgAND BYTE "You chose Boolean AND" ,0
msgOR  BYTE "You chose Boolean OR"  ,0
msgNOT BYTE "You chose Boolean NOT" ,0
msgXOR BYTE "You chose Boolean XOR" ,0

msgInt BYTE "Enter the first hexadecimal integer you want to calculate:  ",0
msgInt2 BYTE "Enter the second hexadecimal integer to work calculate: ",0
msgResult BYTE "The result is: ",0

caseTable BYTE '1'													;lookup value
	DWORD AND_op													;address of procedure
EntrySize = ($ - caseTable )
	BYTE '2'
	DWORD OR_op
	BYTE '3'
	DWORD NOT_op
	BYTE '4'
	DWORD XOR_op
	BYTE '5'
	DWORD ExitProgram
NumberOfEntries = ($ - caseTable) / EntrySize

.code
main PROC

Menu:
	mov edx, OFFSET msgMenu											;menu choices
	call WriteString												;display menu
	call Crlf														;go to next output line
	
	COMMENT!
	
L1:	call ReadChar													;Collect User input
	cmp al, '5'														;is selection valid (1-5)?
	ja L1															;jump if above 5, go back to L1:
	cmp al, '1'														;if less that one jump back to L1:
	jb L1															;if less that one jump back to L1:

	call Crlf														;nextLine
	call ChooseProcedure											;call Procedure		
	jc quit															;jump if carry = 1, exit

	call Crlf
	jmp Menu														;jump back to the menu and start over
	!

	mov ebx, OFFSET caseTable

L1: call readChar
	cmp al, [ebx]
	jne L2
	call NEAR PTR [ebx +1]
	jmp Menu	
	jc quit
	call Crlf

L2: add ebx, entrySize
	loop L1

	call ChooseProcedure
	


quit: exit
main ENDP

ChooseProcedure PROC

	push ebx				; push EBX onto stack
	push ecx				; push ECX onto stack

	mov ebx, OFFSET caseTable	; pointer to the table
	mov ecx, NumberOfEntries	; loop counter

L1:	cmp al, [ebx]			; match found?
	jne L2				; if no, continue
	call NEAR PTR [ebx + 1]		; if yes, call procedure
	jmp L3

L2:	add ebx, EntrySize		; point to the next entry
	loop L1				; repeat until ECX = 0

L3:	pop ecx				; remove ECX from stack
	pop ebx				; remove EBX from stack

	ret					; return from procedure

ChooseProcedure ENDP

AND_op PROC

	pushad				; push all registers onto stack

	mov edx, OFFSET msgAND		; name of the operation
	call WriteString			; display message
	call Crlf
	call Crlf

	mov edx, OFFSET msgInt	; ask for first integer
	call WriteString
	call ReadHex			; get hex integer
	mov ebx, eax			; move first integer to EBX

	mov edx, OFFSET msgInt2	; ask for second integer
	call WriteString
	call ReadHex			; get second hex integer

	and eax, ebx			; integer1 AND integer2

	mov edx, OFFSET msgResult	; result
	call WriteString			; display result
	call WriteHex			; display hex to window
	call Crlf

	popad					; save and restore registers
	ret					; return from procedure

AND_op ENDP

OR_op PROC

	pushad				; push all registers onto stack

	mov edx, OFFSET msgOR		; name of the operation
	call WriteString			; display message
	call Crlf
	call Crlf

	mov edx, OFFSET msgInt	; ask for first integer
	call WriteString
	call ReadHex			; get hexadecimal integer
	mov ebx, eax			; move first integer to EBX

	mov edx, OFFSET msgInt2	; ask for second integer
	call WriteString
	call ReadHex			; get hex integer

	or eax, ebx				; integer1 OR integer2

	mov edx, OFFSET msgResult	; result of operation
	call WriteString
	call WriteHex			; display hex to window
	call Crlf

	popad					; save and restore registers
	ret					; return from procedure
OR_op ENDP

NOT_op PROC

	pushad				; push all registers onto stack

	mov edx, OFFSET msgNOT		; name of the operation
	call WriteString			; display message
	call Crlf
	call Crlf

	mov edx, OFFSET msgInt	; ask for integer
	call WriteString
	call ReadHex			; get hex integer

	not eax				; NOT operand

	mov edx, OFFSET msgResult	; result of operation
	call WriteString
	call WriteHex			; EAX = result
	call Crlf

	popad					; restore registers
	ret					; return from procedure

NOT_op ENDP

XOR_op PROC

	pushad				; push all registers onto stack

	mov edx, OFFSET msgXOR		; name of the operation
	call WriteString			; display message
	call Crlf
	call Crlf

	mov edx, OFFSET msgInt	; ask for first operand
	call WriteString
	call ReadHex			; get hexadecimal integer
	mov ebx, eax			; move first operand to EBX

	mov edx, OFFSET msgInt2	; ask for second operand
	call WriteString
	call ReadHex			; get hex integer

	xor eax, ebx			; integer1 XOR integer2

	mov edx, OFFSET msgResult	; result of operation
	call WriteString
	call WriteHex			; display hex to window
	call Crlf

	popad					; save and restore registers
	ret					; return from procedure

XOR_op ENDP

ExitProgram PROC

	stc					; set the carry flag to 1
	ret					; return from procedure

ExitProgram ENDP

END main