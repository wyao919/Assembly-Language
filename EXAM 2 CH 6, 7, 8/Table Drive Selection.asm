; AddTwo.asm - adds two 32-bit integers.
; Chapter 3 example

INCLUDE IRVINE32.INC

.code

msg1 BYTE "1. Option 1", 0
msg2 BYTE "2. Option 2", 0 
msg3 BYTE "3. Exit", 0 
msg4 BYTE "Press 1, 2, or 3" ,0 

msgA BYTE "You Chose option 1", 0
msgB BYTE "You Chose Option 2", 0 
msgE BYTE "You Chose to exit", 0
msgInvalid BYTE "Option does not exist", 0


CaseTable BYTE 1					; lookup value
DWORD Process_1						; address of procedure
EntrySize = ($ - CaseTable)
BYTE 2
DWORD Process_2
BYTE 3
DWORD Process_3

NumberOfEntries = ($ - CaseTable) / EntrySize

main proc

mov edx, OFFSET msg1
call WriteString
call CRLF

mov edx, OFFSET msg2
call WriteString
call CRLF


mov edx, OFFSET msg3
call WriteString
call CRLF

call CRLF
call CRLF

mov edx, OFFSET msg4
call WriteString

L0:
	call ReadInt
	mov EBX, OFFSET caseTable
	mov ECX, NumberOfEntries 


.IF AL < 0 || AL > 3								;conditional if statement to make sure user inputs 1-5
	mov edx, OFFSET msgInvalid
	Call WriteString
	Call Crlf
	loop L0
.ENDIF


L1:
cmp al, [EBX]
JNE L2 
call NEAR PTR [ebx + 1]


L2:
add EBX, EntrySize		; go to the next entry
loop L1

exit


main endp


Process_1 PROC

pushAD

mov EDX, OFFSET msgA
Call WriteString
	Call Crlf
	Call Crlf

popAD

ret
Process_1 ENDP


Process_2 PROC

pushAD
mov EDX, OFFSET msgB
Call WriteString	
	Call Crlf
	Call Crlf

popAD

ret
Process_2 ENDP


Process_3 PROC

pushAD
mov EDX, OFFSET msgE
Call WriteString
	Call Crlf
	Call Crlf

popAD
ret
Process_3 ENDP

end main