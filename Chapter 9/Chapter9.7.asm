;Willy Yao
;Chapter 9 Question 7;
;Created 5/28/2020

Comment !
Description: The Sieve of Eratosthenes, invented by the Greek mathematician
having the same name, provides a way to find all the prime numbers within
a given range. The algorithm involves creating an array of bytes in which
positions are "marked" by inserting 1's in the following manner: Beginning
with position 2 (which is a prime number), insert a 1 in each array position
that is a multiple of 2. Then do the same thing for multiples of 3, the next
prime number. Find the next prime number after 3, which is 5, and mark all
positions that are multiples of 5. Proceed in this manner until all multiples
of primes have been found. The remaining positions of the array that are
unmarked indicate which numbers are prime. 
!

INCLUDE Irvine32.inc

displayPrime PROTO, counter: DWORD			

.data

firstP = 2
lastP = 500
comma BYTE ", ", 0
arrSiev BYTE lastP DUP(?)

.code
main PROC

	mov	ecx, lastP									;mov ecx, lastP
	mov	edi, OFFSET arrSiev							;mov OFFSET arrsiev to edi
	mov	al, 0							

	mov esi, firstP									;mov 2 to esi

	.WHILE esi < lastP					
	  
	  .IF arrSiev[esi*TYPE arrSiev] == 0			;check prime number
	    call mulitpleM								;call procedure to mark if yes
	  .ENDIF

	  inc esi										;increase to check next number
	.ENDW											;end of while loop

	INVOKE displayPrime, lastP	; display all primes found

	exit
main ENDP

;--------------------------------------------------
mulitpleM PROC
;Marks all multiples of the value passed in ESI.
;--------------------------------------------------

	push eax					;push registers
	push esi
	mov eax,esi					;mov prime value to eax
	add esi,eax					;add to esi 

L1:	cmp	esi, lastP												;check to see if it is the end of the array 
	ja	exitP													;jump to exitP if it is the end
	mov	arrSiev[esi*TYPE arrSiev],1								;insert a marker as 1
	add	esi,eax													;add eax to esi
	jmp	L1														;repeat loop till jump to  exitP

exitP:	pop	esi
	pop	eax
	ret
mulitpleM ENDP

;--------------------------------------------------
displayPrime PROC, counter:DWORD		
;Display the list of prime numbers
;--------------------------------------------------
	mov	esi, 1						
	mov	eax, 0
	mov	ecx,counter

L1:	mov al,arrSiev[esi*TYPE arrSiev]
	.IF al == 0								;IF al == 0 mov esi to eax to display prime
	  mov  eax,esi
	  call WriteDec							;write dec
	  mov  edx,OFFSET comma					;then insert comma
	  call WriteString
	.ENDIF
	inc	esi
	loop L1

	ret
displayPrime ENDP


END main