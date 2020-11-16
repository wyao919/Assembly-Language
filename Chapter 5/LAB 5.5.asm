;BetterRandomRange Procedure
;The RandomRange procedure from the Irvine32 library generates a pseudorandom integer between
;0 and N  1. Your task is to create an improved version that generates an integer between M and
;N1. Let the caller pass M in EBX and N in EAX. If we call the procedure BetterRandomRange, the
;following code is a sample test:

;mov ebx,-300 ; lower bound
;mov eax,100 ; upper bound
;call BetterRandomRange

;Write a short test program that calls BetterRandomRange from a loop that repeats 50 times.
;Display each randomly generated value.

; Willy Yao
; Chapter 5 Question 5
; Created 3/14/2020

INCLUDE Irvine32.inc

.data


min DWORD ?
max DWORD ?
prompt1 BYTE "Please enter a minimum number to show : ", 0
prompt2 BYTE "Please enter a Maxmimum Random Range: ", 0 

.code
    main PROC

mov edx, OFFSET prompt1                                                     ;move offset of prompt1 to edx
call WriteString                                                            ;Display Prompt1

call ReadInt                                                                ;Collect Data
mov min, eax                                                                ;move data in eax to min

mov edx, OFFSET prompt2                                                     ;move offset of prompt2 to edx
call WriteString                                                            ;Display Prompt1

call readInt                                                                ;Collect Data
mov max, eax                                                                ;move data in eax to max
    
        mov eax, min                                                        ;Storing the min integer into eax
        mov ebx, max                                                        ;storing max into ebx
        mov ecx, 50                                                         ;This will make the program loop 50 times

        L1:    
   
            call BetterRandomRange                                          ;Call procedure BetterRandomRange

        Loop L1                                                             ;Loop Cycle 

        exit

    main ENDP

    ; ------------------------------------------------------
      BetterRandomRange PROC USES EAX EBX

    ; Generates a random number from the minimum number to the highest maximum number that was inputed by the user
    ; Returns EAX as the random number

        sub ebx, eax            ;subtract eax to ebx
        xchg ebx, eax           ;random works with eax
        call RandomRange        ;generate random int
        neg ebx                 ;negative ebx
        sub eax, ebx            ;sub ebx from eax to define range
        call WriteInt           ;write signed decimal
        call Crlf               ;create a space
        ret
    BetterRandomRange ENDP


    END main

