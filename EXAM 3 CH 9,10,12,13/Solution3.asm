include c:\irvine\irvine32.inc

.data
prompt1 BYTE "Enter height of cylinder: ",0
prompt2 BYTE "Enter radius of cylinder: ",0
msg     BYTE "Area of cylinder: ",0
height  REAL8 ?
radius   REAL8 ?
area    REAL8 ?
const2Pi REAL8 6.28318


.code
start:
main PROC
    finit
    
    ; read the height
    mov  edx, offset prompt1
    call writeString
    call readFloat
    fstp height
    
    ; read radius
    mov  edx, offset prompt2
    call writeString
    call readFloat
    fstp radius
    
    ; calculate 2*PI*Radius*height
    fld const2Pi
    fmul radius
    fmul height
    
    ; calculate 2*Pi*radius*radius
    fld const2Pi
    fmul radius
    fmul radius
    
    ; calculate area
    fadd
    fst area
    
    ;display area
    mov  edx, offset msg
    call writeString
    call writeFloat
    call crlf
    
    
    call WaitMsg
    exit
main ENDP
END main

