;Willy Yao
;Date 5/29/2020
;Chapter 10 Question 9

INCLUDE Irvine32.inc

mShiftDoublewords MACRO arrayName, direction, numberOfBits
;macrod takes array name direction and number of bits

LOCAL L1
	mov	bl, numberOfBits				;move number of bits to bl (to shift)
	mov ecx,(LENGTHOF arrayName) - 1	;counter
	mov esi,OFFSET arrayName			;offset arrayname

IFIDNI <direction>,<'L'>				;Check if left shift

L1:	push ecx							;push ecx loop count
	mov eax,[esi + TYPE DWORD]			;move next lowest dword to eax
	mov cl,bl							;number of bits to cl to count
	shld [esi],eax,cl					;shift low bits of eax to [esi]
	add esi,TYPE DWORD					;next 
	pop ecx								;pop ecx
	loop L1

	shl DWORD PTR [esi],numberOfBits		;shift last doubleword 

ELSE										;if not shift left then shift right

	; point to the last array element
	add	esi,(SIZEOF arrayName) - (TYPE DWORD)

L1:	push ecx					;push ecx to save loop counter
	mov eax,[esi - TYPE DWORD]	;get next doubleword
	mov cl,bl					;move shift count to cl
    shrd [esi],eax,cl			;shift high bits of eax to [esi]
	sub esi,TYPE DWORD			;next
	pop ecx						;pop ecx
	loop L1

	shr DWORD PTR [esi],numberOfBits		;shift right

ENDIF  
  
ENDM

.data
array DWORD 5,10,15,20,25

.code
main PROC

	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	mov ebx,TYPE array

	call DumpMem						;display original values

	mShiftDoublewords array,'L',3		;shift left 3 bits
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	mov ebx,TYPE array

	call DumpMem						;dump mem

	mShiftDoublewords array,'R',3		;shift right 3 bits to check starting values
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	mov ebx,TYPE array

	call DumpMem						;dump mem		
	
	mShiftDoublewords array,'L',5		;shift left 5 bits
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	mov ebx,TYPE array

	call DumpMem
	
	mShiftDoublewords array,'R',5		;shift right 5 bits to check starting value
	mov esi,OFFSET array
	mov ecx,LENGTHOF array
	mov ebx,TYPE array

	call DumpMem						;dump mem			
	exit
main ENDP


END main