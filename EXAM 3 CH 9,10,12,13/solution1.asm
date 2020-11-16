include c:\irvine\irvine32.inc

str_concat PROTO, target:PTR BYTE, source:PTR BYTE
str_concat2 PROTO, target:PTR BYTE, source:PTR BYTE

.data

target BYTE "ABCDE", 10 DUP(0)
source BYTE "FGH", 0
msg    BYTE "Modified Target String: ", 0


.code
start:
main PROC
    INVOKE str_concat2, ADDR target, ADDR source                ;call concat    
    mov edx, offset msg                                         ;display write string after the concat
    call writeString

    mov edx, offset target
    call writeString
    call crlf
    
    call WaitMsg
    exit
main ENDP

str_concat PROC, targ:PTR BYTE, sour:PTR BYTE
    ; Point at the end of target string
    mov edi, targ
L1:
    mov ebx, [edi]
    cmp ebx, 0
    je CopySource
    inc edi
    jmp L1
    
CopySource:
    mov esi, sour
L2:
    mov ebx, [esi]
    cmp ebx, 0
    je done
    mov [edi], ebx
    inc edi
    inc esi
    jmp L2
    
done:
    ret      
str_concat ENDP

str_concat2 PROC, targ:PTR BYTE, sour:PTR BYTE
    INVOKE str_length, targ
    add    targ, eax
    INVOKE str_length, sour
    mov    ecx, eax
    inc    ecx
    mov    esi, sour
    mov    edi, targ
    cld
    rep    movsb
    ret
str_concat2 ENDP

END main

