;ExampleDIV.ASM  THIS program divides large numbers
section .text
     global main           ;must be declared for linker (ld)
main:       ;tell linker entry point


; display the product
; now divide things
;
xor edx, edx
mov eax, [v1]; load v1 the dividend into ax
;sub     eax, '0'; convert
mov ecx, [v2]; load v2 the divisor into cx
;sub     ecx, '0'; convert
div ecx;    perform the division

sub     eax, 0D
mov [rquotient], eax; save the quotient

sub     edx, 0D
mov [rremainder], edx; save the remainder
;
;===================Display values================================

;Display quotient
; the quotient message
	   mov         edx,lenQuotient          ;message length
           mov         ecx,dispQuotient         ;quotient
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 

; display the actual value of the product
	   mov         edx,4               	;message length
           mov         ecx,rquotient            ;quotient as a number
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 

;display new line
           mov         edx,1                    ;message length
           mov         ecx,newLine              ;carriage return
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel
;
; display remainder
	   mov         edx,lenRemainder         ;remainder message length
           mov         ecx,dispRemainder       	;remainder
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 
; remainder as a number
	   mov         edx,4               	;message length
           mov         ecx,rremainder           ;remainder as a number
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 

;display new line
           mov         edx,1                    ;message length
           mov         ecx,newLine              ;carriage return
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel
; now exit
           mov         eax,1                    ;system call number (sys_exit)
           int         0x80                     ;call kernel
;
section .data
newLine db 10  ; carriage return;
v1 dd 143D; first number
v2 dd 20D; second number
;
;strings for displying values
dispQuotient db  "The quotient is : ";
lenQuotient equ $-dispQuotient; find length
dispRemainder db "The remainder is: ";
lenRemainder equ $-dispRemainder; find length
;
section .bss; for other values- results
rquotient resd 1; one byte for storing the quotient
rremainder resd 1; one byte for storing the remainder

; end of data section
