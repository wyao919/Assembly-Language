;Willy Yao
;FINAL EXAM QUESTION 1
;CREATED 6/4/2020

INCLUDE Irvine32.inc

Str_remove PROTO, startC:PTR BYTE, charN:DWORD

.data
target BYTE "abcxxxxdefghijklmop",0
msg1 BYTE "After removing 'xxx': ", 0 
msg2 BYTE "After removing 'a': ", 0 
msg3 BYTE "After removing 'de': ", 0 

.code
main PROC

	mov edx, OFFSET msg1									;display message 1
	call writeString										
	INVOKE Str_remove, ADDR [target+3], 4					;invoke procedure to remove xxx
	mov edx,OFFSET target									;display result
	call WriteString
	call Crlf

	mov edx, OFFSET msg2									;display message 2
	call writeString										;invoke procedure to remove a
	INVOKE Str_remove, ADDR target, 1						;display result
	mov edx,OFFSET target
	call WriteString
	call Crlf

	mov edx, OFFSET msg3
	call writeString	
	INVOKE Str_remove, ADDR [target+2], 2					;display message 3
	mov edx,OFFSET target									;invoke procedure to remove de
	call WriteString										;display result
	call Crlf

	exit
main ENDP

;-------------------------------------------------------
Str_remove PROC, startC:PTR BYTE, charN:DWORD
;Removes characters from a string where startC is the 
;starting character and charN = number of characters to delete
;-------------------------------------------------------

	INVOKE Str_length, startC			;get string length and mov to ecx
	mov	ecx,eax					

	.IF charN <= ecx					;check the range of number of characters
		 sub ecx,charN					;mov number of chars to ecx for counter
	.ENDIF

	mov	esi,startC						;point to string
	add	esi,charN						;points to character
	mov	edi,startC						;points to destination

	rep	movsb							;move characters
	mov	BYTE PTR [edi],0				;insert null byte

	ret
Str_remove ENDP


END main