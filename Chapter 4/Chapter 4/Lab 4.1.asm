; Converting from Big Endian to Little Endian
; Write a program that uses the variables below and MOV instructions to copy the value from
; bigEndian to littleEndian, reversing the order of the bytes. The number’s 32-bit value is understood
; to be 12345678 hexadecimal.
;Chapter 4 Question 1
; Willy Yao
; Created 3/3/2020

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
bigEndian BYTE 12h, 34h, 56h, 78h
littleEndian DWORD ?

.code
main proc
  mov al,[bigEndian+3]                              ;Move data of bigEndian+3 (78h) into al
  mov BYTE PTR [littleEndian],al                    ;Move data in al to Memory Location littleEndian
  mov al,[bigEndian+2]                              ;Move data of bigEndian+2 (56h) into al
  mov BYTE PTR [littleEndian+1],al                  ;Move data in al to Memory Location littleEndian+1
  mov al,[bigEndian+1]                              ;Move data of bigEndian+1 (34h) into al
  mov BYTE PTR [littleEndian+2],al                  ;Move data in al to Memory Location littleEndian+2
  mov al,[bigEndian]                                ;Move data of bigEndian (12h) into al
  mov BYTE PTR [littleEndian+3],al                  ;Move data in al to Memory Location littleEndian+3

	invoke ExitProcess,0
main endp
end main