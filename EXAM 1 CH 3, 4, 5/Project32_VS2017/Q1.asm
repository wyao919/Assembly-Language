;Willy Yao
;Test Chapter 3,4,5 Question 1
;3x + 2y – z

INCLUDE Irvine32.inc

.data

numX SDWORD ?
numY SDWORD ?
numZ SDWORD ?
result SWORD ?
msg1 BYTE "Enter a value for x: ", 0 
msg2 BYTE "Enter a value for y: ", 0 
msg3 BYTE "Enter a value for z: ", 0 
msg4 BYTE "The number of the evaluated expression is: ", 0 


.code
    main PROC
        
        mov edx, OFFSET msg1            ;Move msg1 to edx to display using write string
        call WriteString                ;Call write string to display message in msg1
        call ReadDec                    ;Collect user input

        mov ecx, 3                      ;Set the loop counter to 3

    L1:                                 ;Loop to add NumX 3 times without using multiplication
         add numX, eax               
    Loop L1

        mov edx, OFFSET msg2            ;Move msg2 to edx to display using write string
        call WriteString                ;Call write string to display message in msg2
        call ReadDec                    ;Collect user input

        mov ecx, 2                      ;Set the loop counter to 2

     L2: 
            add numY, eax               ;Loop to add NumY 2 times without using multiplication
     Loop L2

        mov edx, OFFSET msg3            ;Move msg3 to edx to display using write string
        call WriteString                ;Call write string to display message in msg3
        call ReadDec                    ;Collect user input

        mov numZ, eax                   ;move user input to numZ
            
        mov eax, numX                   
        add eax, numY
        sub eax, numZ
        
        mov edx, OFFSET msg4            ;Move msg4 to edx to display using write string
        call WriteString                ;Call write string to display message in msg3
        Call WriteDec                   ;Display the result after displaying the String


    exit
main ENDP

END main

