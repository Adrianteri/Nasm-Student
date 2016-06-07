;
; example 6 on division of numbers
section .text
    global main     ;must be declared for using gcc
main:    ;tell linker entry point

        mov     ax,'6' 
        sub     ax, '0' 
        mov     bl, '2'
        sub     bl, '0' 
        div     bl 
        add     ax, '0' 
        mov     [res], ax 
        mov     ecx,msg 
        mov     edx, length 
        mov     ebx,1    ;file descriptor (stdout) 
        mov     eax,4    ;system call number (sys_write) 
        int     0x80     ;call kernel 
;
;
; display the result
        mov     ecx,res 
        mov     edx, 1 
        mov     ebx,1    ;file descriptor (stdout) 
        mov     eax,4    ;system call number (sys_write) 
        int     0x80     ;call kernel 
;
;display new line
           mov         edx,1                    ;message length
           mov         ecx,newLine              ;carriage return
           mov         ebx,1                    ;file descriptor (stdout)
           mov         eax,4                    ;system call number (sys_write)
           int         0x80                     ;call kernel 
; exit
        mov     eax,1    ;system call number (sys_exit) 
        int     0x80     ;call kernel 
;
;
section .data
msg:     db     "The result is:"
length: equ $ - msg  ; length
newLine db 10  ; carriage return;
;
;
segment .bss 
res: resb 1 
; explain how this program works
; 
