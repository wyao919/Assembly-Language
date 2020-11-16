;Willy Yao
;Chapter 9 Question 6;
;Created 5/20/2020

INCLUDE Irvine32.inc

Get_frequencies PROTO, pString: PTR BYTE, pTable: PTR DWORD				;create prototype for Procedure

.data
freq DWORD 256 DUP(0)									
userInput BYTE 80 DUP(0),0
msg1 BYTE "Enter between 1 and 80 characters: ",0

.code
main PROC

	mov edx, OFFSET msg1												;display msg1
	call WriteString

	mov  ecx,SIZEOF userInput - 1										;mov size of string -1 to ecx for loop counter
	mov  edx,OFFSET userInput											;move OFFSET of userInput to EDX
	call ReadString														

	INVOKE Get_frequencies, ADDR userInput, ADDR freq

	exit
main ENDP

;-------------------------------------------------------------
Get_frequencies PROC, input: PTR BYTE, frequency: PTR DWORD	
;This constructs a character frequency table
;And will count how many times a character occured.
;--------------------------------------------------------------
	mov	esi, input					;mov ptr input into esi
	mov	edi, frequency				;mov ptr frequency into edi
	cld								;clear Direction flag (forward)

L1:	mov	eax,0						;mov 0 to eax
	lodsb							;mov [esi] to al
	cmp	al,0						;check to see if string is at the end
	je	ExitP						;jump to exitP if yes
	shl	eax,2						;multiply eax by 4
	inc	DWORD PTR[edi+eax]			;add to table entry
	jmp	L1							;repeat L1

ExitP:
	ret
Get_frequencies ENDP

END main