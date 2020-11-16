include c:\irvine\irvine32.inc

mReadArray MACRO arrayName:REQ


LOCAL prompt
.data
prompt BYTE "Enter a signed integer: ", 0
.code
    mov ecx, lengthof &arrayName
    mov esi, offset &arrayName
L1:
    mov edx, offset prompt
    call writeString
    call readInt
    mov  SDWORD PTR [esi], eax
    add esi, 4
    loop L1
ENDM

mWriteArray MACRO arrayName:REQ
LOCAL space, msg
.data
space BYTE " ", 0
msg   BYTE "Contents of &arrayName: ", 0dh, 0ah, 0

.code
    mov edx, offset msg
    call writeString
    mov  edx, offset space
    mov  esi, offset &arrayName
    mov  ecx, lengthof &arrayName
L2:
    mov eax, SDWORD PTR [esi]
    call writeInt
    call writeString
    add  esi, 4
    loop L2
    
    call crlf
ENDM

.data
intArray SDWORD 5 DUP(?)

.code
start:
main PROC
    mReadArray intArray
    mWriteArray intArray
    
    call WaitMsg
    exit
main ENDP
END main

