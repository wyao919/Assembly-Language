; Write a program with a loop and indexed addressing that calculates the sum of all the gaps
; between successive array elements. The array elements are doublewords, sequenced in nondecreasing
; order. So, for example, the array {0, 2, 5, 9, 10} has gaps of 2, 3, 4, and 1, whose sum
; equals 10.
; Chapter 4 Question 3
; Willy Yao
; Created 3/3/2020

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
intArray DWORD 0,2,5,9,10
result DWORD 0

.code
main proc
     mov esi, OFFSET intArray                        ;this will give you the address of 1st element of the array (esi = pointer to 1st element)
     mov ecx, LENGTHOF intArray                      ;ecx needs to be used with loops, ecx = loop counter 
  

L1:
     mov eax,[esi]                                   ;mov data stored at esi to eax
     mov ebx,[esi+4]                                 ;move data stored at [esi+4] to ebx
     SUB ebx,eax                                     ;Subtract EAX and store to ebx
     add result,ebx                                  ;add ebx to the result
     add esi, TYPE intArray                          ;point to next array element
     loop L1                                         ;loop end point


	invoke ExitProcess,0
main endp
end main