;Willy Yao
;Created 5/4/2020
;Chapter 8 Question 9

INCLUDE IRVINE32.inc

CountNearMatches proto, ptr1:PTR SDWORD,ptr2:PTR SDWORD, arraySize:DWORD, diff:DWORD

.data

array1 SDWORD 3,6,9,12,15
array2 SDWORD 1,3,5,7,9
array3 SDWORD 2,6,12,18,22
arraySize = LENGTHOF array1
difference = 2


.code 
main proc

	invoke CountNearMatches,ADDR array1, ADDR array2, arraySize, difference             ;invoke procedure with arguments
	invoke CountNearMatches,ADDR array1, ADDR array3, arraySize, difference             ;invoke procedure with arguments
    
exit
main endp

;---------------------------------------------------------------------------------------------------
CountNearMatches proc, ptr1:PTR SDWORD, ptr2:PTR SDWORD, count:DWORD, diff:DWORD
;
;This procedure compares each elements of the array and determins whether or not they have a
;difference of greater or less than 2. It will add it to the count of how many are greater than or 
;equal to 2. It saves pushes and pops all registers in stack besides EAX which is used as the counter
;____________________________________________________________________________________________________
    push esi                     ;save registers besides EAX
    push edi
    push ecx
    push edx

    mov  esi,ptr1                ;move ptr1 into esi
    mov  edi, ptr2               ;move ptr2 into edi 
    mov  ecx, count              ;move 2 ecx
    mov  eax,0                   

L1: mov  edx,[esi]               ;mov [esi]into edx to subtract [edi]
    sub  edx,[edi]      
    jns  L2                      ;check if difference is negative and if it is jump to L2
    neg  edx                     ;if it is negative turn it into a positive

L2:
    cmp  edx,diff                
    ja  L3                      ;jump to L3 if the difference is over 2
    inc  eax                    ;count increases

L3: add  esi,4                  ;move to next memory location
    add  edi,4                  ;move to next memory location
    loop L1

    pop  edx                ;pop registers 
    pop  ecx
    pop  edi
    pop  esi
    ret            

CountNearMatches endp

end main
