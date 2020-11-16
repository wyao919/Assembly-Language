; Chapter 3 Question 3
;Write a program that contains a definition of each data type listed in Table 3-2 in Section 3.4.
;Initialize each variable to a value that is consistent with its data type.

.386
.model flat,stdcall
.stack 4096
ExitProcess proto,dwExitCode:dword

.data
B1 BYTE		10					;8-bit unsigned integer
B2 SBYTE   -10					;8-bit signed integer
W1 WORD     2000				;16-bit unsigned integer
W2 SWORD   -2000				;16-bit unsigned integer
d0 DWORD    12345678			;32-bit unsigned integer
d1 SWORD   -12345			    ;32-bit signed integer
FW FWORD    0					;48-bit integer(Far pointer in protected mode)
QW QWORD    12345678h 			;64-bit integer. Q Stands for Quad
TB TBYTE    100123456789Ah  	;80 bit (10-byte) integer. T Stands for 10 Byte
R4 REAL4    -1.25				;32 bit(4-byte) short real
R8 REAL8    -1.25f				;64 bit(8-byte) long real
R1 REAL10   1234123.32f			;80-bit(10-byte) extended real


.code
main proc

	invoke ExitProcess,0
main endp
end main