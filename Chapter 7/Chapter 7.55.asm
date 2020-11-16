;Willy Yao
;Created 4/24/2020
;Chapter 7 Question 5

COMMENT !

Prime Numbers
Write a program that generates all prime numbers between 2 and 1000, using the Sieve of Eratosthenes
method. You can find many articles that describe the method for finding primes in this
manner on the Internet. Display all the prime values.

!

INCLUDE irvine32.inc

n = 996

.data
primeN DWORD ?
compositeL BYTE n + 2 DUP(0)


.code
main PROC
	mov ebp, 2									;move 2 to ebp
	mov edi, OFFSET primeN						;move offset of primeN to edi
L1:
	mov eax, 2									;mov 2 to eax
	mul ebp										;Square ebp
	cmp eax, n									;condition check. If eax > n then to showPrime
	ja showPrime								;jump to showPrime if eax 

	mov bl, compositeL[ebp]	
	cmp bl, 1									;Check  if ebp is a marked number
	je continue									;move to next number if it is equal

	mov ebx, eax								;mov eax to ebp	
L2:				
	mov compositeL[ebx], 1						;mark index of ebx
	add ebx, ebp								;add ebp to edx 
	cmp ebx, n									;compare ebx to n
	jbe L2										;continue loop if below or equal

continue:
	inc ebp										;increment ebp +1
	jmp L1										;return to begining of loop

showPrime:
	mov ebp, 1									;array index
	mov ecx, n									;move n to ecx to set the upper limit

L3:
	inc ebp
	mov bl, compositeL[ebp]						;if array index is not marked
	cmp bl, 1
	jne printPrime								;jump if not equal to printPrime and get results
	loop L3										;loop l3 if not

printPrime:
	mov eax, ebp								;move ebp to eax to print
	call WriteDec					
	call Crlf
	loop L3

	call WaitMsg
		
		
		
		exit
main ENDP
END main