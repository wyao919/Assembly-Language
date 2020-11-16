;Willy Yao
;FINAL EXAM QUESTION 2
;CREATED 6/4/2020

INCLUDE irvine32.inc

mPrintChar MACRO charToPrint:REQ,		;character to print
				 numPrint:REQ			;how many times the number will be printed

LOCAL L1

	mov al, charToPrint					;character to print
	mov ecx, numPrint					;loop counter
L1:
	call writeChar						;print char
	loop L1							

ENDM

.data

.code
main PROC

	mPrintChar ' ', 4					;print 4 spaces
	mPrintChar '1', 1					;then print 1
	mPrintChar ' ', 4					;print another 4 spaces
	call Crlf							;next line

	mPrintChar ' ', 3					;print 3 spaces
	mPrintChar '2', 3					;then print 2
	mPrintChar ' ', 3					;print another 3 spaces
	call Crlf

	mPrintChar ' ', 2					;print 2 spaces
	mPrintChar '3', 5					;then print 3
	mPrintChar ' ', 2					;print another 2 spaces
	call Crlf

	mPrintChar ' ', 1					;print 1 spaces
	mPrintChar '4', 7					;then print 4
	mPrintChar ' ', 1					;print another 1 spaces
	call Crlf

	mPrintChar '5', 9					;print 5 , 5 times
	call Crlf							;nextline

	mPrintChar ' ', 1					;the rest of the code is the same as above just the other way
	mPrintChar '4', 7
	mPrintChar ' ', 1
	call Crlf

	mPrintChar ' ', 2
	mPrintChar '3', 5
	mPrintChar ' ', 2
	call Crlf

	mPrintChar ' ', 3
	mPrintChar '2', 3
	mPrintChar ' ', 3
	call Crlf

	mPrintChar ' ', 4
	mPrintChar '1', 1				
	mPrintChar ' ', 4
	call Crlf

	exit

main ENDP
END main