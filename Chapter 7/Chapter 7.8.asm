;Willy Yao
;Created 4/20/2020
;Chapter 7 Question 8

INCLUDE Irvine32.inc

.data
;4 byte pair
packed_1a WORD 4536h
packed_1b WORD 7207h

;8 byte pair
packed_2a DWORD 57812386h
packed_2b DWORD 95862435h

;16 byte pair
packed_3a QWORD 7586485215368594h
packed_3b QWORD 3569857485781254h

sum1 DWORD ?
sum2 DWORD ?
sum3 DWORD ?

.code
main PROC

	mov	sum1 , 0										;initialize sum1 to 0
	mov	edx,OFFSET sum1									;move offets of Sum1 to edx
	mov	esi,OFFSET packed_1a							;move OFFSET of packed1_a to esi (Number 1)
	mov	edi,OFFSET packed_1b							;move OFFSET of packed1_b to edi (Number 2)
	mov	ecx,SIZEOF packed_1a							;move the size of packed_1a to ecx

	call addPacked										;call procedure addPacked			

	mov	eax, sum1										;this will display the sum in hex
	call WriteHex
	call Crlf


	mov	sum2 , 0										;initialize sum2 to 0
	mov	edx,OFFSET sum2
	mov	esi,OFFSET packed_2a							;move OFFSET of packed2_a to esi (Number 1)
	mov	edi,OFFSET packed_2b							;move OFFSET of packed2_b to edi (Number 2)
	mov	ecx,SIZEOF packed_2a							;move the size of packed_2a to ecx

	call	AddPacked									;call procedure addPacked			
	
	mov	eax, sum2 + 4									;sum2 + 4 to eax and display the first half
	call WriteHex										;Display first half
	mov	eax,sum2										;move sum 2 to eax to display 1st half
	call	WriteHex									;display sum
	call	Crlf


	mov	sum3,0											;initialize sum3
	mov	edx,OFFSET sum3									;move offets of Sum1 to edx
	mov	esi,OFFSET packed_3a							;move OFFSET of packed3_a to esi (Number 1)
	mov	edi,OFFSET packed_3b							;move OFFSET of packed3_b to edi (Number 2)
	mov	ecx,SIZEOF packed_3a							;move the size of packed_3a to ecx

	call AddPacked										;call procedure addPacked			

	mov	ecx,3											;loop counter 3
	mov	esi,2											;mov 2 to esi

L1:	mov	eax, sum3[esi*4]								;sum3[esi*4] toeax to display
	call WriteHex										;display portion
	dec	esi												;decriment esi by 1
	loop L1												;nextLine

	call Crlf

	exit
main ENDP

;-----------------------------------------------------------
addPacked PROC
;
;Adds two packed decimal integers of the same size
;ESI is the first number and EDI is the second number
;ECX represents the number of bytes to add and ESI to EDX as sum
;------------------------------------------------------------

; Add  bytes, include carry.

L1:	mov	al,[esi]									;mov [esi] to al
	adc	al,[edi]									;add with carry edi
	daa												;adjust after addition
	mov	[edx],al									;mov sum into edx

	inc	esi											;increase all to move to next byte
	inc	edi
	inc	edx
	loop	L1

	mov	al,0										;add final carry 
	adc	al,0
	mov	[edx],al
	
	ret
AddPacked ENDP

END main       



