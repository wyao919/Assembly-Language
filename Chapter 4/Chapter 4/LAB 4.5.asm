; Write a program that uses a loop to calculate the first seven values of the Fibonacci number sequence,
; described by the following formula: Fib(1) = 1, Fib(2) = 1, Fib(n) = Fib(n – 1) + Fib(n – 2).

; Chapter 4 Question 5
; Willy Yao
; Created 3/4/2020

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data

fibArray DWORD 7 DUP (1,1,?,?,?,?,?)

.code
main proc
	mov esi, OFFSET fibArray						;this will give you the address of 1st element of the array (esi = pointer to 1st element)
	add esi, 8										;this will point to the 3rd element of the array
	mov ecx, 5 										;ecx needs to be used with loops, ecx = loop counter
L1:													;All loops must use labels
	mov eax, [esi-4]								;Fib(n – 1)
	mov ebx, [esi-8]								;Fib(n – 2)
	add eax, ebx									;Fib(n – 1) + Fib(n – 2)	
	mov [esi], eax									;mov added number to Fib array
	add esi, TYPE fibArray							;point to next array element
loop L1

	invoke ExitProcess,0
main endp
end main