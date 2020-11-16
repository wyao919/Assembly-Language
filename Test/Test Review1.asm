INCLUDE Irvine32.inc

.data

num1 SDWORD ?
num2 SDWORD ?
sum SDWORD ?
difference SDWORD ?
msg1 BYTE "Enter an Integer: ", 0
msg2 BYTE "Enter another number: ", 0
msg3 BYTE "The Sum of the 2 added together is: " ,0
msg4 BYTE "The Difference of the 2 is: ", 0

.code
    main PROC

    mov edx, OFFSET msg1
    call WriteString

    call readInt
    mov num1, eax

    mov edx, OFFSEt msg2
    call WriteString

    call readInt
    mov num2, eax

    add eax, num1
    mov sum, eax

    mov eax, num1
    mov ebx, num2

    sub eax, num2

    mov difference, eax

    mov eax, sum

    mov edx, OFFSET msg3
    call WriteString 
    call WriteInt 
    call CrLf
    
    mov eax, difference
    mov edx, OFFSET msg4
    call WriteString 
    call WriteInt 


        exit

    main ENDP

  

    END main

