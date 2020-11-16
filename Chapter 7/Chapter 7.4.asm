;Willy Yao
;Created 4/18/20
;Chapter 7 Question44

INCLUDE Irvine32.inc

.data

key BYTE -2, 4, 1, 0, -3, 5, 2, -4, -4, 6
kSize = $ - key
Text BYTE "This will be encrypted" , 0

.code

main PROC

    mov esi, OFFSET Text                ;point to memory location Text to ESI

    ;L1 is the first half that Encrypts the message
L1: 
    mov ecx, OFFSET kSize               ;move offset of kSize to ecx
    mov edi, OFFSET key                 ;move offset of key to edi
    call Encrypt

    jnz L1                              ;loop back to L1 if Zero flag is not set

    mov edx, OFFSET Text	            ;mov encrpyted text to edx
	call WriteString                    ;display encrypted text


    mov esi, OFFSET text                ;move the offset back to the beggining of ESI

    ;L2 Decrypts the Message

L2: 
    mov ecx, OFFSET kSize               ;move offset of kSize to ecx
    mov edi, OFFSET key                 ;move offset of key to edi
    call Decrypt

    jnz L2                              ;loop back to L1 if Zero flag is not set

    mov edx, OFFSET Text	            ;mov encrpyted text to edx
	call WriteString                    ;display encrypted text

Done:

exit

main ENDP


;------------------------------------------------------------------------------------------------
Encrypt PROC 
;This procedure checks to see if the number is positive or negative. If it is positive it rotates right to the amount given.
;If negative then it rotates left
;------------------------------------------------------------------------------------------------
L1:
    cmp BYTE PTR [esi], 0               ;End of the String Check
    je Done                             ;If end of String jump to exit and return Zero Flag

    mov cl, [edi]                       ;mov edi to cl
    cmp cl, 0                           ;Compare CL to 0 
    jge rotateR                         ;if greater than or equal (positive) Then jump to rotateR
    rol BYTE PTR [esi], cl              ;else rotate left (Negative)
    jmp L2

rotateR: 
    ror BYTE PTR [esi], cl

L2:
    inc esi                             ;jump to next letter
    inc edi                             ;jump to next key
    loop L1

Done:

ret


Encrypt ENDP

;---------------------------------------------------------------------------------------
Decrypt PROC
;This procedure checks to see if the number is positive or negative. If it is positive it rotates LEFT to the amount given.
;If negative then it rotates RIGHT. This is the exact opposite of the Encrypt procedure
;------------------------------------------------------------------------------------------------

L1:
    cmp BYTE PTR [esi], 0               ;End of the String Check
    je Done                             ;If end of String jump to exit and return Zero Flag

    mov cl, [edi]                       ;mov edi to cl
    cmp cl, 0                           ;Compare CL to 0 
    jge rotateL                         ;if greater than or equal (positive) Then jump to rotateR
    ror BYTE PTR [esi], cl              ;else rotate left (Negative)
    jmp L2

rotateL: 
    rol BYTE PTR [esi], cl              ;Rotate Left 

L2:
    inc esi                             ;jump to next letter
    inc edi                             ;jump to next key
    loop L1

Done:

ret

Decrypt ENDP

END main
 