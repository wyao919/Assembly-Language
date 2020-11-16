;Willy Yao
;Exam 2 Question 1
;5-12-2020

INCLUDE IRVINE32.inc

countPositive PROTO, arr:PTR SDWORD, arrlength: DWORD				;This is Procedure Proto

.data
	msg1 BYTE "Number of values in array 1 is: ",0
	msg2 BYTE "Number of values in array 2 is: ",0

	array1 SDWORD 18, -25, 30, -50
	array2 SDWORD -5, -20, -2, -40
	totalP SDWORD ?

.code

main PROC

	INVOKE countPositive, ADDR array1 , LENGTHOF array1    				;invoke Procedure and pass in esi
	mov eax, totalP														;mov Total to eax to print
	mov edx, OFFSET msg1												;Display Message + total
	call WriteString
	call WriteDec
	CALL CRLF

	INVOKE countPositive, ADDR array2, LENGTHOF array2					;invoke Procedure and pass in esi
	mov eax, totalP														;move total to eax to write 
	mov edx, OFFSET msg2												;Display Message + total
	call WriteString
	call WriteDec							


	exit
main EndP

;---------------------------------------------------------------------
countPositive PROC, arr: PTR SDWORD, arrlength: DWORD
;This procedure counts all positive numbers and adds them to totalP
;it recieves a arr PTR SDWORD
;---------------------------------------------------------------------
mov totalP, 0
pushAD											;save all registers

mov ESI, arr									;mov offset array2 to esi
mov ecx, arrlength								;counter loop

L1:
mov edx, [esi]									;mov esi to edx to compare
cmp edx, 0										;compare to 0
jl L2											;jump to L2 if less than 0
inc totalP										;else increment totalP 

L2:										
add esi, 4
LOOP L1

popAD											;pop all registers

ret												;return to main program

countPositive ENDP

END MAIN

