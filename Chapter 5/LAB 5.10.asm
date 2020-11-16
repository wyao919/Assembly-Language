; Fibonacci Generator
; Write a procedure that produces N values in the Fibonacci number series and stores them in an
; array of doubleword. Input parameters should be a pointer to an array of doubleword, a
; counter of the number of values to generate. Write a test program that calls your procedure,
; passing N = 47. The first value in the array will be 1, and the last value will be 2,971,215,073.
; Use the Visual Studio debugger to open and inspect the array contents.


; Willy Yao
; Chapter 5 Question 10
; Created 3/15/2020

INCLUDE Irvine32.inc

.data
array DWORD 1,1         
count DWORD 45
.code
main PROC

  mov ESI, OFFSET array                 ;move offset of array into esi
  Add ESI, 8                            ;increase ESI + 8 
  mov ecx, count                        ;how many times to loop

  L1:
    call FibonacciG                     ;call procedure FibonacciG
    ADD ESI, 4                          ;most to next element in memory
  Loop L1

INVOKE ExitProcess,0
main ENDP


;--------------------------------------------

FibonacciG PROC
; This procedure generates numbers in a Fibonacci Sequence and stores them into and Array with the last digit being 2,971,215,073
; See notes on the side for step by step look at what is going on


    MOV EAX,[ESI-4]                     ;Store Memory Location [ESI-4] into EAX
    MOV EBX,[ESI-8]                     ;Store Memory Location [ESI-8] into EBX
    ADD EAX,EBX                         ;Add EAX and EBX and store them into EAX
    MOV [ESI],EAX                       ;Store Added Value SUM of EAX into memory location ESI of array

    ret
FibonacciG ENDP

END main