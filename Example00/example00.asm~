;Displays 30 stars
;points TIMES 30 DW 0;creates 30 values

 SECTION.txt
   global main     ;must be declared for linker(ld)
 main:             ;tell linker entry point

; display stars
   
    mov     edx,50       ;message length
    mov     ecx,stars    ;message to write
    mov     ebx,1        ;file descriptor(stdout)
    mov     eax,4        ;system call number(sys_write)
    int     0x80         ;call kernel
  
;display a new ine

    mov     edx,1        ;message length      
    mov     ecx,NewLine  ;carriage return
    mov     ebx,1        ;file descriptor(stdout)
    mov     eax,4        ;system call number(sys_write)
    int     0x80         ;call kernel

;
;
;now exit 
    mov     eax,1       ;system call number(sys_write)
    int     0x80        ;call kernel

 SECTION.data
stars times 30 db '*'
NewLine db 10 ;carriage return
;end of data section

