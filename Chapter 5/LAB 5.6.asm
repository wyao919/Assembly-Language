; Random Strings
; Create a procedure that generates a random string of length L, containing all capital letters.
; When calling the procedure, pass the value of L in EAX, and pass a pointer to an array of byte
; that will hold the random string. Write a test program that calls your procedure 20 times and displays
; the strings in the console window.


; Willy Yao
; Chapter 5 Question 6
; Created 3/14/2020


INCLUDE Irvine32.inc


.data
StringLength = 10
StringArray BYTE StringLength DUP(?)


.code
    main PROC

        mov esi, OFFSET StringArray                            ;set esi at the beggining of th StringArray
        mov ecx, 20                           ;loop counter to display Loop L1 20 Times

    L1:
        call RandomString                     ;call procedure Random String

    Loop L1

    main ENDP
    ;-------------------------------------------------------------------------------------------
      RandomString PROC USES ecx  
    ; This Procedure Generates a Random Capital letter and displays it 10 times in a row before skipping to the next line
    ; See notes on each line

        mov ecx, lengthof StringArray   ;move 10 to ECX so it loops 10 times

    L2:
        mov eax, 26                     ;move 26 to random number so random call will generate random number from 0-25
        call RandomRange                ;generate random number from 0-25
        add eax, 65                     ;add 65 to generated number because CAPITAL letters are stored from 65-90 in ASCII table
        call WriteChar                  ;write character which prints from registery AL

    loop L2     
        call Crlf                       ;Next line after 19 characters are written
        ret

    RandomString ENDP

END main