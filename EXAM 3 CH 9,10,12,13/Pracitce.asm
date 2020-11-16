INCLUDE irvine32.inc

str_concat PROTO, target:PTR BYTE, source:PTR BYTE

.data

target BYTE "ABCD", 10 dup(0)
source BYTE "MNOP", 0 

.code

main proc

invoke str_concat, ADDR target, ADDR source
mov edx, OFFSET target
call writeString

exit

main endp

str_concat PROC, targ: PTR BYTE, sour: PTR BYTE

mov edi, targ

L1:

mov ebx, [edi]
cmp ebx, 0 

je addString
inc edi
jmp L1

addString:
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

str_concat endP

end main
