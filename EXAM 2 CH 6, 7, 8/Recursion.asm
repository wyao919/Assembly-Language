INCLUDE Irvine32.inc

Recursion PROTO, num1:DWORD, num2:DWORD									;Procedure protoType

.data

.code
main PROC

invoke recursion, 4, 7
invoke recursion, 5, 8

exit

main ENDP

;---------------------------------------------
Recursion PROC,
	num1:DWORD, num2:DWORD        ;This is what it receives
;This program finds the greatest common demonitator using Euclids algorithym
;---------------------------------------------
	mov  eax, num1						;mov to eax
	mov  ebx, num2						;mov to ebx
	mul  ebx							;num1 / num2
	cmp  ebx, 1							;check if ebx equal to 1

	je   L2								;jump to label L2 if = 1 
	call CRLF
	call WriteInt

	mov ecx, num1
	mov edx, num2
	sub edx, 1
	invoke recursion, ecx, edx


L2:	
	ret

Recursion ENDP

END main