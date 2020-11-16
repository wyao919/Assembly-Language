
;Willy Yao 
;Chapter 6 question 9
;Created 4/23/2020


INCLUDE Irvine32.inc

.data
pin1 DWORD 3, 4, 5, 3, 4				;Test Pin
pin2 DWORD 5, 2, 4, 1, 3				;Test Pin
pin3 DWORD 3, 3, 4, 1, 5				;Test Pin
pin4 DWORD 3, 4, 5, 7, 8				;Test Pin

max DWORD 9, 5, 8, 4, 6					;max numbers for positions
min DWORD 5, 2, 4, 1, 3					;min numbers for positions

msgInvalid BYTE "Invalid PIN", 0		;invalid str
msgValid BYTE "Valid PIN", 0			;valid str

.code
main PROC
	mov esi, OFFSET pin1				;move address of pin1 to esi
	call Validate_PIN					;call procure
	call Crlf							;next line

	mov esi, OFFSET pin2				;move addres of pin2 to esi
	call Validate_PIN					;call procedure
	call Crlf							;next line
				
	mov esi, OFFSET pin3				;move address of pin3 to esi
	call Validate_PIN					;call procedure
	call Crlf							;next line

	mov esi, OFFSET pin4				;move address of pin4 to esi
	call Validate_PIN					;call procedure
	call Crlf							;next line

	exit
main ENDP

;-----------------------------------------------------
Validate_PIN PROC
;Validates the pin with max and min values for each position
;Receives: esi = 5 digit array & Returns: EAX = 0 if valid
;-----------------------------------------------------

	PUSHAD								;Save registers
	
	mov ecx, 5							;set loop count to 5
	mov edx, OFFSET max					;move address max to edx
	mov ebx, OFFSET min					;move address min to ebx
L1:
	mov eax, [esi]						
	cmp eax, [edx]						
	ja L2								;jump to L2 if [esi] > [edx]
	cmp eax, [ebx]
	jb L2								;jump to invalid if [esi] < [ebx]

	add esi, TYPE DWORD					;increment array ptr
	add edx, TYPE DWORD	
	add ebx, TYPE DWORD
	loop L1

	mov edx, OFFSET msgValid			;mov msgValid address to edx
	call WriteString					;display msgValid
	call crlf							;next line
	mov eax, 0							;eax returns zero
	jmp quit
L2:
	mov edx, OFFSET msgInvalid			;mov invalid msg to edx
	call WriteString					;display message
	call crlf							;next line

	jmp quit
quit:
	popad								;restore all registers
	ret
Validate_PIN ENDP
END main

