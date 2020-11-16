;Willy Yao
;Created 4/27/2020
;Chapter 8 Question 6



INCLUDE Irvine32.inc

Swap PROTO,					
	pValX:PTR DWORD,
	pValY:PTR DWORD


.data
msg1 BYTE "Original array: ",0
msg2 BYTE "Array swapped: ",0
array DWORD 16 DUP(?)


.code
main PROC

	call Randomize												;Calls the random number generator with a unique value.
	mov  esi, OFFSET array										;mov esi, OFFSET array
	mov  ecx, LENGTHOF array 									;ecx counter

L1:	call Random32												;EAX = random number
	mov  [esi], eax												;save generated number into array
	add  esi, TYPE array										;add to esi 4 (DWORD)
	loop L1

																		
	mov  edx, OFFSET msg1										;move message to display into edx
	call WriteString											;call writestring
	call Crlf													;create next line

	mov esi,OFFSET Array										;prepare to dump mem
	mov ecx, LENGTHOF array
	mov ebx,TYPE Array

	call dumpmem												;Dump Memory from location array

	mov  esi, OFFSET array										;mov offset of array to esi
	mov  ecx, LENGTHOF array 									;ecx counter
	shr  ecx, 1													;shift right to get to the next pair

L2:	INVOKE Swap, esi, ADDR [esi + 4]							;swap
	add  esi, TYPE array * 2									;Check the next pair
	loop L2
																;display swapped numbers
	mov  edx, OFFSET msg2										;message to display
	call WriteString    
	call Crlf

mov esi,OFFSET Array											;prepare to dump mem
	mov ecx, LENGTHOF array
	mov ebx,TYPE Array

	call dumpmem												;Dump Memory from location array

	exit
main ENDP

;-------------------------------------------------------
Swap PROC USES eax esi edi,
	pValX:PTR DWORD,		;pointer to first number
	pValY:PTR DWORD			;pointer to second number
;
; Exchange the values of two integers
;-------------------------------------------------------

	mov	esi, pValX			;get pointers
	mov	edi, pValY
	mov	eax, [esi]			;get first integer
	xchg eax,[edi]			;exchange with second
	mov	[esi],eax			;replace first integer
	ret

Swap ENDP


END main