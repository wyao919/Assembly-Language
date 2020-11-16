;Willy Yao
;Chapter 9 Question 5
;Created 5/20/2020

INCLUDE Irvine32.inc

Str_nextWord PROTO, StringPTR: PTR BYTE, delim: BYTE			;prototype for procedure

.data
string1 BYTE "123,456,78,90",0

.code
main PROC
	mov  edx, OFFSET string1					;mov OFFSET of string1 to edx to display original string msg
	call WriteString
	call Crlf

	mov	esi,OFFSET string1						;Mov OFFSET of string1 to esi
	
L1:	INVOKE Str_nextword, esi, ","				;call method with 2 arguments
	jnz	Exit1									;Jump to exit if delimiter not found.
	mov	esi, eax								;point to next substring
	mov	edx, eax
	call WriteString							;display String
	call Crlf									;NextLine
	jmp	L1

Exit1:
	exit
main ENDP

;---------------------------------------------------------------
Str_nextWord PROC, StringPTR: PTR BYTE, delim: BYTE			
;This procedure will scan the string for a delimiter and replace it with a
;null byte
;
;---------------------------------------------------------------
	
	push esi						;save register esi
	mov al, delim					;mov ptr delim to al
	mov esi, StringPTR				;mov ptr String PTR to esi

L1:
	lodsb							;load [esi] to al
	cmp	al, 0						;Check end of String
	je L3							;jump to l3 if equal to 0
	cmp	al,delim					;compare al to delim
	jne	L1							;repeat loop if not found

L2:	
    mov	BYTE PTR [esi-1], "0"		;yes: insert null byte
	mov	eax, esi					;point EAX to next character
	jmp	Exit2						;exit with ZF = 1

L3:
   or al,1							;clear zf

Exit2:
	pop	esi
	ret
Str_nextWord ENDP

END main