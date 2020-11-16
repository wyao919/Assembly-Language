;Willy Yao 
;Chapter 6 question 3
;Created 4/23/2020

INCLUDE Irvine32.inc

.data

msg1 BYTE "The score is: ",0
msg2 BYTE "The grade is:  ",0
msgError BYTE "ERRORS", 0

.code
main PROC
    mov ecx, 10
    l1:  
        mov eax, 50                     ;set eax to 50
        call RandomRange                ;generate random int witin range 0 to N
        add eax, 51                     ;add 51 to eax so the score ranges from 50-100
        mov edx, offset msg1            ;move offset msg1 to edx
        call WriteString                ;call WriteString to display message1
        call WriteInt                   ;call WriteInt to display the random unsigned number in EAX
        call crlf                       ;NextLine
        call CalcGrade                  ;call function CalcGrade
        call crlf                       ;NextLine
    loop l1

    call WaitMsg
    exit
main ENDP

;-----------------------------------------------------
CalcGrade PROC USES EAX EDX ECX
;
;Checks the integer score in EAX and assigns it a 
;letter grade in AL using .IF and .ELSEIF statements
;-----------------------------------------------------

.IF (eax > 100 || eax < 0)              ;Test condition
	mov edx, OFFSET msgError            ;if condition is True display error message
	call WriteString                    ;if condition is True display error message
	call Crlf       
	jmp quit                            

.ENDIF

    .IF eax >= 90    
      mov al,'A'    
    .ELSEIF eax >= 80
      mov al,'B'
    .ELSEIF eax >= 70
      mov al,'C'
    .ELSEIF eax >= 60
      mov al,'D'
    .ELSE
      mov al,'F'
    .ENDIF
      
    mov edx, OFFSET msg2               ;move offset msg2 into edx
    call WriteString                   ;Display message in edx 
    call WriteChar                     ;Dispaly Character in AL register
    call Crlf

    ret

quit:
	
	ret

CalcGrade ENDP

END main
