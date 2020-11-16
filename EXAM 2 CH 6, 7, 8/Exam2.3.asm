;Willy Yao
;Exam 2 Question 3
;5-12-2020

INCLUDE Irvine32.inc

recDiv PROTO, num1:DWORD, num2:DWORD					;ProtoType for Procedure

.data


.code
main PROC
	mov eax, 0											;mov eax to 0 to clear
	INVOKE recDiv, 30, 6								;invoke procedure with 2 numbers to pass in

	call writeint										;display the answer
	call CRLF											;next line

	mov eax, 0											;mov eax to 0 to clear
	INVOKE recDiv, 100, 10								;invoke procedure with 2 numbers to pass in
	call writeint										;display the answer

	exit
main ENDP

;-----------------------------------------------------
recDiv PROC,num1: DWORD, num2:DWORD 
; 
;This Procedure is a recursive call for division
;it increments eax as a counter to see how many times
;it will divide into
;-----------------------------------------------------

	mov ebx, num1										;mov value passed in num1 to ebx		
	mov ecx, num2										;mov value passed in num2 to ecx
	cmp ebx, ecx										;compare ebx to ecx
	jae cont											;jump if greater and equal to cont
	
	ret													;return if not greater and equal	
cont:
	sub ebx, ecx										;subtract ebx from ecx
	inc eax												;increment eax as a counter

	invoke recDiv, ebx, ecx								;call procedure

	ret
recDiv ENDP
END main