;Example00  program displays 30 stars.
section .text
     global main           ;must be declared for linker (ld)
main:       ;tell linker entry point

; add things here
mov ax, [v1]; load v1 into ax
mov bx, [v2]; load v2 into ax
add ax, bx; perform the addition
aaa
or ax, 30h
mov [rsum], ax; save the sum 
;
;
; multiply things now
mov al, [v1]; load v1 the multiplicand into ax
mov bl, [v2]; load v2 the multiplier into bx
mul bl; perform the multiplication
aam; ascii adjust after multiplication
add ax, '0'; convert to ascii number
aaa; adjust after multiplication
or ax, 30h; strip some bits
mov [rproduct], ax; save the product
;
; display the product
; now divide things
;
mov ax, '4'; [v1]; load v1 the dividend into ax
sub     ax, '0'; convert
mov cx, '2'; [v2]; load v2 the divisor into cx
sub     cx, '0'; convert
div cx;    perform the division
add     ax, '0'
mov [rquotient], al; save the quotient
;
add     ah, '0'
mov [rremainder], ah; save the remainder
;
;===================Display values================================
;Now display the results of the arithemtic operations
; the sum message
	   mov         edx,lenSum               ;message length
           mov         ecx,dispSum              ;sum
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 

; display the actual value of the sum
	   mov         edx,1               	;message length
           mov         ecx,rsum              	;sum as a number
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
;
;Display the product
; the product message
	   mov         edx,lenProduct               ;message length
           mov         ecx,dispProduct              ;sum
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 

; display the actual value of the product
	   mov         edx,1               	;message length
           mov         ecx,rproduct              	;product as a number
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 

;display new line
           mov         edx,1                    ;message length
           mov         ecx,newLine              ;carriage return
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 
;;
;Display quotient
; the quotient message
	   mov         edx,lenQuotient          ;message length
           mov         ecx,dispQuotient         ;quotient
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 

; display the actual value of the product
	   mov         edx,1               	;message length
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
	   mov         edx,1               	;message length
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
v1 db 4; first number
v2 db 2; second number
;
;strings for displying values
dispSum db " The sum is: ";
lenSum equ $-dispSum ; compute the length of the sum
dispProduct db " The product is: " ; 
lenProduct equ $-dispProduct ; find length
dispQuotient db " The quotient is: ";
lenQuotient equ $-dispQuotient; find length
dispRemainder db "The remainder is: ";
lenRemainder equ $-dispRemainder; find length
;
section .bss; for other values- results
rsum resw 2; one word for storing the sum
rproduct resw 2; one word for storing the product
rquotient resb 2; one byte for storing the quotient
rremainder resb 2; one byte for storing the remainder

; end of data section
