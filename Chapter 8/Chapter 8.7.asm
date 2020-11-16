;Willy Yao
;Created 4/27/2020
;Chapter 8 Question 7

INCLUDE Irvine32.inc

GCD PROTO,num1:DWORD, num2:DWORD									;Procedure protoType

.data

msg1 BYTE "Greatest common divisor is: ",0
array SDWORD 5,20,24,18,11,7,438,226,26,13

.code
main PROC

	mov  ecx,LENGTHOF array / 2					;mov length of array / 2 for pairs
	mov  esi,OFFSET array						;mov offset of array to esi

L1:	INVOKE GCD,[esi],[esi+4]					;invoke procedure and pass by value
	mov  edx, OFFSET msg1						;mov msg1 into edx
	call WriteString							;Display message
	call WriteDec								;Display Decimal
	call Crlf									;next line


	add  esi,TYPE array * 2
	loop L1

	exit
main ENDP

;---------------------------------------------
GCD PROC,
	num1:DWORD, num2:DWORD        ;This is what it receives
;This program finds the greatest common demonitator using Euclids algorithym
;---------------------------------------------
	mov  eax, num1						;mov to eax
	mov  ebx, num2						;mov to ebx
	mov  edx,0							;clear
	div  ebx							;num1 / num2
	cmp  edx,0							;check if edx equal to 0
	je   L2								;jump to label L2 if = 0 
	INVOKE GCD,ebx,edx					;call procedure again

L2:	mov	eax,ebx							;mov the GDC to EAX
	ret
GCD ENDP

END main