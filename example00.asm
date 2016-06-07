;Example00  program displays 30 stars.
section .text
     global main           ;must be declared for linker (ld)
main:       ;tell linker entry point
; display stars
           mov         edx,50                    ;message length
           mov         ecx, stars               ;message to write
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
; now exit
           mov         eax,1                    ;system call number (sys_exit)
           int         0x80                     ;call kernel
section .data
stars     times 30 db '*'
newLine db 10  ; carriage return;
; end of data section
