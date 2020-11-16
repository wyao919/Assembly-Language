;In a byte array of size N, write a procedure that finds all multiples of K that are less than N. Initialize
;the array to all zeros at the beginning of the program, and then whenever a multiple is
;found, set the corresponding array element to 1. Your procedure must save and restore any registers
;it modifies. Call your procedure twice, with K = 2, and again with K = 3. Let N equal to 50.
;Run your program in the debugger and verify that the array values were set correctly. Note: This
;procedure can be a useful tool when finding prime integers. An efficient algorithm for finding
;prime numbers is known as the Sieve of Eratosthenes. You will be able to implement this algorithm
;when conditional statements are covered in Chapter 6.


; Willy Yao
; Chapter 5 Question 11
; Created 3/15/2020

INCLUDE Irvine32.inc


.data

N = 50
array BYTE N DUP(0)
K DWORD ?

.code
main PROC

    mov K, 2                                        ;Set K = 2
    call multiK                                     ;call multiK
  
    MOV ECX, N                                      ;Move 50 to ECX for loop counter

    L2:                                             ;This Loops Reinitializes the array to 0
        MOV ESI, 0                                  ;move 0 to esi
        ADD ESI, TYPE array                         ;move to next memory location of array

    LOOP L2

    mov K, 3                                        ;Change K to 3
    call multiK                                     ;Call procedure multiK

INVOKE ExitProcess,0
main ENDP

multiK PROC USES ECX ESI EBX EDX

    MOV ESI, OFFSET array                           ; Start at the beggiing of array
    MOV ECX, N                                      ; loop thorugh array 50 times
    MOV EDX, 1                                      ; compare array index 1 to 50
    MOV EBX, K                                      ; multiple of K
    L1:
        CMP EBX, EDX                                ; Compare EBX and EDX (Got this from Chapter 6)

        JNE notEqual                                ; Jump to next if Compare does not equal (Got this from Chapter 6)
       
        MOV BYTE PTR [ESI], 1                       ; This line will execute if multiple is found
        ADD EBX, K                                  ; Add K to EBX

        notEqual:                                       
        INC EDX                                     ;Increment EDX
        ADD ESI, TYPE array                         ;Move to next location of array. 
    Loop L1

    ret
multiK ENDP
END main