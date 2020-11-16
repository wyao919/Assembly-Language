;Willy Yao
;Test Chapter 3,4,5 Question 3

;Write a procedure, called sumTwoArrays,  that receive the following 4 parameters through the indicated registers.

;The address of a DWORD array in register ESI
;The address of a second DWORD array of equal size in register EDX
;The address of a third DWORD array also of equal size in register EDI
;The size of the three arrays in register ECX
;The procedure should then use a loop to add the elements of the first two arrays, pointed to by registers ESI and EDX, and store the sum in the third array, pointed to by register EDI.

;For example, passing to the sumTwoArrays procedure the size (5) of the above declared three arrays in register ECX and the addresses of the above array1, array2, and arraySum arrays in registers ESI, EDX, and EDI respectively should result in the following decimal values in the arraySum array.

INCLUDE Irvine32.inc

.data

array1   DWORD  10, 20, 30, 40, 50
array2   DWORD  60, 70, 80, 90, 100
arraySum DWORD 5 DUP(?)

.code
    main PROC

        mov esi, OFFSET array1                      ;set esi to offset array1
        mov edx, OFFSET array2                      ;set edx to offset array2
        mov edi, OFFSET arraySum                    ;set edi to offset arraySum
        mov ecx, LENGTHOF array1                    ;Set ECX size to array size 

        call sumTwoArrays                           ;Call Procedure 

        mov esi, OFFSET arraySum                    ;Move ESI for MEMDUMP
        mov ecx, LENGTHOF arraySum                  ;Move ECX for MEMDUMP
        mov ebx, TYPE arraySum                      ;Move EBX for MEMDUMP

        CALL DUMPMEM                                ;Diplay Memory dump for arraySum

        exit

main ENDP

sumTwoArrays PROC 

;This Procedure Moves the data in memory location ESI to eax and EDX to ebx then adds the two together and stores them into EDI


    L1:
        mov eax, [esi]                              ;Move esi to eax 
        mov ebx, [edx]                              ;Move edx to ebx
        add eax, ebx                                ;Move ebx and store in eax
        mov [edi], eax                              ;move result of eax and store into edi        
        add esi, TYPE array1                        ;move to next memory location in array1
        add edx, TYPE array2                        ;move to next memory location in array2 
        add edi, TYPE arraySum                      ;move to next memory location in arraySum
    Loop L1
    
    ret
sumTwoArrays ENDP

END main

