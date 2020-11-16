; AddTwoSum_64.asm - Chapter 3 Question 6.
;.386										;declaration not needed
;.model flat,stdcall						;declaration not needed
;.stack 4096								;declaration not needed
ExitProcess proto

.data
firstval  qword 20002000h
secondval qword 11111111h
thirdval  qword 22222222h
sum qword 0

.code
main proc
mov	rax,firstval				
	add	rax,secondval		
	add rax,thirdval
	mov sum,rax
	call  ExitProcess
main endp				;64 can not use invoke
end


COMMENT!
There were many errors changing this to 64 bit. First I changed all the dword to qword but when trying to run it stated that
it will not fit into the registers. I then had to change eax a 32 bit register to a 64 bit register rax so that my variables will fit

INVOKE is also does not work in 64 bit so it removed.
32 bit declarations were also removed at the top.

in Short:
;Changed dword to qword which is 64 bit
;Switched out 32 bit eax register to a 64 bit register rax
;Removed INVOKE
;Removed declaration .386, .stack

!