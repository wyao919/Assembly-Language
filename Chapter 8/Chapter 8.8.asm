;Willy Yao
;Created 5/4/2020
;Chapter 8 Question 8


INCLUDE IRVINE32.inc

CountMatches proto, ptr1:PTR SDWORD, ptr2: PTR SDWORD, arrayLength:DWORD

.data

array1 sdword 4,3,4,-6,12						;3 matches for the array with array 2
array2 sdword 10,3,3,-6,12       
array3 sdword 3,1,3,7,3							;0 matches with array1
count = LENGTHOF array1							;this will be the count

.code 
main proc

INVOKE CountMatches, ADDR array1, ADDR array2, count		;this will pass arguments array1, array2, count	into CountMatches proc
INVOKE CountMatches, ADDR array1, ADDR array3, count		;this will pass arguments array1, array2, count	into CountMatches proc

exit

main endp

;---------------------------------------------------------------------------------------------
CountMatches proc, ptr1: PTR SDWORD, ptr2: PTR SDWORD, arrayLength: DWORD
;
;This procedure takes 3 arguments in an array. It then compares the values in each 
;corresponding array index
;
;---------------------------------------------------------------------------------------------

	push ecx									;save all registers besides EAX
	push edx
	push edi
	push esi

	mov esi, ptr1								;move array ptr into esi
	mov edi, ptr2								;move other array ptr into edi
	mov ecx, arrayLength						;mov the length into ecx as a counter 
	mov eax, 0

	L1:
		mov edx, [esi]							;compare the arrays
		cmp edx, [edi]
		jne L2
		inc eax			

	L2: add  esi,4								;go to next number in array
		add  edi,4
		loop L1

	pop  esi								;restore all registers
	pop  edi
	pop  edx
	pop  ecx
	ret             
CountMatches endp


end main

