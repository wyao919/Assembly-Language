;Willy Yao
;Created 4/18/2020
;Chapter 7 Question 6

INCLUDE Irvine32.inc

.data
array SDWORD 13 ,5,8518,8469,525,65823
msg1 BYTE "Greatest common divisor is: ",0

.code
main PROC

	mov	ecx, LENGTHOF array / 2					;Set length of array / 2 to ECX (will be finding GCD using pairs)
	mov  esi,OFFSET array						;Set offset of array to ESI

L1:	mov  eax,[esi]								;mov value of esi into eax
	mov  ebx,[esi+4]							;mov next value of esi into ebx
	call FindGCD								;call procedure to find the GCD

	mov  edx,OFFSET msg1						;CallWrite String
	call WriteString							;Display GCD for the pair
	call WriteDec
	call Crlf									;Next Line
	add  esi ,TYPE array * 2					;Skip to next pair
	loop L1										;loop L1

	exit

main ENDP

;---------------------------------------------
FindGCD PROC uses EBX EDX
;---------------------------------------------

	.IF SDWORD PTR ebx < 0						;Check Negative
	  neg ebx									;Make this absoulate value
	.ENDIF

	.IF SDWORD PTR eax < 0						;Check Negative				
	  neg eax									;Make this absoulate value
	.ENDIF

L1:	mov  edx,0									;
	div  ebx									;Divide EAX and EBX
	cmp  edx,0									;If remainder is 0 then GCD Found can jump to quit (Remainder of division gets stored in EDX)
	je   L2				
	mov  eax,ebx								; mov ebx to eax to for next try
	mov  ebx,edx								; move remainder of EDX into ebx
	jmp  L1

L2:	mov eax,ebx									;if Remainder is 0 then move the GCD into EAX


	ret
FindGCD ENDP

END main