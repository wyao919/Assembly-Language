;Willy Yao 
;Chapter 6 question 5 & 6
;Created 4/23/2020

INCLUDE Irvine32.inc

.data
 
CaseTable BYTE 1													;Look up Value
				DWORD AND_op										;Address of Procedure
EntrySize = ($ - CaseTable)
		  BYTE 2
				DWORD OR_op
	      BYTE 3
				DWORD NOT_op
		  BYTE 4
			    DWORD XOR_op
	      BYTE 5
				DWORD EXIT_op
numberOfEntries = ($ - CaseTable) / EntrySize

msgMenu BYTE "Boolean Calculator"									;msg for the menu
	BYTE 0dh, 0ah													;0dh and 0ah will jump to the next line
	BYTE "1. x AND y"     ,0dh,0ah
	BYTE "2. x OR y"      ,0dh,0ah
	BYTE "3. NOT x"       ,0dh,0ah
	BYTE "4. x XOR y"     ,0dh,0ah
	BYTE "5. Exit program", 0

;This section includes all messages that will be used

msgAND BYTE "You chose Boolean AND" ,0
msgOR  BYTE "You chose Boolean OR"  ,0
msgNOT BYTE "You chose Boolean NOT" ,0
msgXOR BYTE "You chose Boolean XOR" ,0
msgNO BYTE "Invalid entry please enter another", 0
msgInput BYTE "Please enter the first Hexidecimal Numberto calculate: " , 0
msgInput2 BYTE "Please enter the Second Hexidecimal Number to calculate: " , 0
msgResult BYTE "The result is: ", 0

.code
main PROC

L0:
mov edx, OFFSET msgMenu								;move msg menu to display edx
call WriteString									;display Message menu
call Crlf											;next line
call Crlf

call readInt										;read an integer or user input
mov ebx, OFFSET CaseTable							;move memory address case table to ebx
mov ecx, numberOfEntries							;loop counter of number of entries

.IF AL < 0 || AL > 5								;conditional if statement to make sure user inputs 1-5
	mov edx, OFFSET msgNO
	Call WriteString
	Call Crlf
	loop L0
.ENDIF


L1:
	cmp al, [ebx]									;compare ebx to user input
	jne L2											;jump to l2 if not equal
	call NEAR PTR [ebx + 1]							;Matches, Call the procedure
	jmp L0											;Jump back to the menu so user can choose another selection
	call Crlf										;NextLine
	call Crlf										;NextLine

	jmp L3											;Jump to label L3

L2:
	add ebx, EntrySize								;Check next number 
	loop L1											;go back to L1

L3:													

exit												;Exit Procedure

main ENDP
;-----------------------------------------------------
AND_op PROC 
;
;This procedure calls the user to enter 2 Hexidecimal numbers. 
;The procedure will AND them together and display the result in Hexidecimal
;-----------------------------------------------------
	pushAD
	mov edx, OFFSET msgAND
	call WriteString

	call Crlf

	mov edx, OFFSET msgInput
	Call WriteString
	Call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInput2
	Call WriteString
	Call ReadHex
	and eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	
	popAD
	ret
AND_op ENDP

;-----------------------------------------------------
OR_op PROC
;This procedure calls the user to enter 2 Hexidecimal numbers. 
;The procedure will OR them together and display the result in Hexidecimal
;-----------------------------------------------------

	pushAD
	mov edx, OFFSET msgOR
	call WriteString

	call Crlf

	mov edx, OFFSET msgInput
	Call WriteString
	Call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInput2
	Call WriteString
	Call ReadHex
	OR eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	
	popAD
	ret

OR_op ENDP

;-----------------------------------------------------
NOT_op PROC
;This procedure calls the user to enter a Hexidecimal number. 
;The procedure will perform a BOOLEAN NOT operation and display it in hexadeximal
;-----------------------------------------------------

	pushAD
	mov edx, OFFSET msgNOT
	call WriteString

	call Crlf

	mov edx, OFFSET msgInput
	Call WriteString
	Call ReadHex
	NOT eax

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	
	popAD
	ret
NOT_op ENDP

;-----------------------------------------------------
XOR_op PROC
;This procedure calls the user to enter 2 Hexidecimal numbers. 
;The procedure will XOR them together and display the result in Hexidecimal
;-----------------------------------------------------

	pushAD
	mov edx, OFFSET msgXOR
	call WriteString

	call Crlf

	mov edx, OFFSET msgInput
	Call WriteString
	Call ReadHex
	mov ebx, eax

	mov edx, OFFSET msgInput2
	Call WriteString
	Call ReadHex
	XOR eax, ebx

	mov edx, OFFSET msgResult
	call WriteString
	call WriteHex
	call Crlf

	
	popAD
	ret
XOR_op ENDP

;-----------------------------------------------------
EXIT_OP PROC
;This procedure will exit the program
;-----------------------------------------------------

	exit
EXIT_OP ENDP


END main