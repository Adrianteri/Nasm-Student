section .text
    global main          ;must be declared for using gcc
main:   ;tell linker entry point
        sub     ah, ah
        mov     al, '5'
        sub     al, '2'
        aas
        or      al, 30h
        mov     [res], ax
        mov      edx,len  ;message length
        mov      ecx,msg  ;message to write
        mov      ebx,1    ;file descriptor (stdout)
        mov      eax,4    ;system call number (sys_write)
        int      0x80     ;call kernel
;
        mov      edx,1    ;message length
        mov      ecx,res  ;message to write
        mov      ebx,1    ;file descriptor (stdout)
        mov      eax,4    ;system call number (sys_write)
        int      0x80     ;call kernel
        mov      eax,1    ;system call number (sys_exit)
        int      0x80     ;call kernel

; display the new line
        mov      edx,1    ;message length
        mov      ecx,nline  ;message to write
        mov      ebx,1    ;file descriptor (stdout)
        mov      eax,4    ;system call number (sys_write)
        int      0x80     ;call kernel
; exit part
        mov      eax,1    ;system call number (sys_exit)
        int      0x80     ;call kernel
section .data
msg db 'The Result is:'
len equ $ - msg
nline db 10 
nllen equ $-nline
section .bss
res resb 1

