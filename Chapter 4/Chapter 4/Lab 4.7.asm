;Write a program with a loop and indirect addressing that copies a string from source to target,
;reversing the character order in the process. Use the following variables:
;source BYTE "This is the source string",0
;target BYTE SIZEOF source DUP('#')

; Chapter 4 Question 7
; Willy Yao
; Created 3/6/2020

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
source BYTE "This is the source string",0
target BYTE SIZEOF source DUP('#')


.code
main proc
	
	mov esi, 0									;start at beggining of the string
	mov ecx, SIZEOF source						;Move Size of bytes into ECX for decrimenter
	mov edi, LENGTHOF source-1					;Start index at the end, We minus 1 to get rid of the null operater

L1:
	mov al, source[esi]							;move source[esi] to al register
	mov target[edi],al							;move al to end of the Target
	add esi, 1									;move to next index
	sub edi, 1									;minus 1 index from the end
	loop L1							

	invoke ExitProcess,0
main endp
end main