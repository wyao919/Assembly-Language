; Chapter 3 Question 1

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.code
main proc
	mov	eax, 7				;move 7 into register eax
	mov ebx, 8				;move 8 into register ebx
	mov ecx, 5				;move 5 into register ecx
	mov edx, 6				;move 6 into register edx

	add eax, ebx			;add ebx to eax
	add ecx, edx			;add edx to ecx
	sub eax, ecx			;subtract ecx from eax and store answer in eax			

	invoke ExitProcess,0
main endp
end main
