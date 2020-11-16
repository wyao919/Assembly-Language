;Willy Yao
;Test Chapter 3,4,5 Question 2

INCLUDE irvine32.inc

.data
intList DWORD 1, 2, 3, 4, 5, 6, 7, 8, 9, 10

.code
main PROC
		
	mov esi, OFFSET intList                    ;Move ESI for MEMDUMP
    mov ecx, LENGTHOF intList                  ;Move ECX for MEMDUMP
    mov ebx, TYPE intList                      ;Move EBX for MEMDUMP

    CALL DUMPMEM                               ;Diplay Memory dump for arraySum	mov esi, OFFSET intList
	mov ecx, 5								   ;This is for the loop counter (5 Pairs)
L1:
	mov eax, [esi]							   ;move number to eax
	mov ebx, [esi+4]						   ;move second number to ebx
	mov [esi], ebx							   ;Swap number
	mov [esi+4], eax						   ;Swap Number
	add esi, 8								   ;move 2 memory locations over to start on next pair
loop L1
	
	mov esi, OFFSET intList                    ;Move ESI for MEMDUMP
    mov ecx, LENGTHOF intList                  ;Move ECX for MEMDUMP
    mov ebx, TYPE intList                      ;Move EBX for MEMDUMP	call WaitMsg
	call DUMPMEM							   ;Display memory Dump
	Exit
main ENDP
end main