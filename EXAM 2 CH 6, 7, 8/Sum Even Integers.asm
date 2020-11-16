INCLUDE IRVINE32.inc

addArray PROTO, arr:PTR SDWORD


.data

array1 SDWORD 10, 15, 18, -25, 30, -12, 3, 2, -1
array2 SDWORD 10, 25, 33, -5, -20, 35, -40, 55
sum SDWORD ?

.code



main PROC



mov ESI, OFFSET array1
mov ecx, LENGTHOF array1

INVOKE addArray, [esi]

mov eax, sum
call writeint
CALL CRLF

mov ESI, OFFSET array2
mov ecx, LENGTHOF array2

INVOKE addArray, [esi]

mov eax, sum
call writeint





exit
main EndP


addArray PROC, arr: PTR SDWORD

mov sum, 0

pushAD
L1:
mov edx, [esi]
mov eax, [esi]
mov bl, 2
idiv bl
cmp ah, 0
jne L2
add sum, edx

L2:
add esi, 4
LOOP L1

popAD


ret

addArray ENDP



END MAIN

