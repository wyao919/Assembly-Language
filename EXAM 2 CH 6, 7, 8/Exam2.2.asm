;Willy Yao
;Exam 2 Question 2
;5-12-2020

INCLUDE irvine32.inc

LargestVal PROTO, array:PTR SDWORD, aLength:DWORD						;This is Procedure Proto

.data

	msg1 BYTE "The Largest Value in array 1 is: ",0
	msg2 BYTE "The Largest Value in array 2 is: ",0

	array1 SDWORD  18, -25, 30, -50
	array2 SDWORD -5, -20, -2, -40

.code
main PROC

	INVOKE LargestVal, ADDR array1, LENGTHOF array1						;invoke Procedure passing in
	mov edx, OFFSET msg1												;Display Message + total
	call WriteString
	call WriteInt														;display the Largest Value
	call Crlf

	INVOKE LargestVal, ADDR array2, LENGTHOF array2						;invoke Procedure passing in
	mov edx, OFFSET msg2												;Display Message + total
	call WriteString
	call WriteInt														;display the Largest Value

	exit

main ENDP

;-------------------------------------------------------------
LargestVal PROC USES esi edi, array:PTR SDWORD,	aLength:DWORD
;
;Find the largest element in a array and display it
;-------------------------------------------------------------
	mov esi, array														;move passed in value of array to esi	
	mov ecx, aLength													;move passed in value of length of array to ecx as a counter
	mov eax, [esi]														
L1:
	cmp eax, [esi]														;compare
	jg L2																;Jump to L2 if Greater
	mov eax, [esi]

L2:
	add esi, 4															;next val
	loop L1																;Loop L1
	ret

LargestVal ENDP
END main