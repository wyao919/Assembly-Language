INCLUDE Irvine32.inc

.data

array DWORD 1, 2, 3, 4, 5
array2 DWORD 5 DUP (?)



.code
    main PROC

       mov esi, 0
       mov ecx, LENGTHOF array-1
       mov bl, 2


   L1:
       mov eax, [array + ESI]
       mul bl
       mov [array2 + ESI], eax
       add esi, 4
   Loop L1



    main ENDP




    END main

