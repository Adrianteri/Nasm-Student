SECTION.txt   ; code segment
   global main   ; must be declared for linker(id)
  main:   ; tell linker entry point

   mov edx,len         ;message length
   mov ecx,msg         ;message to write
   mov ebx,1           ;file descriptor(stdout)
   mov eax,4           ;system call number(sys_write)
   int 0x80            ;call kernel


   mov eax,1           ;system call number(sys_exit)
   int 0x80            ;call kernel



SEGMENT.data           ;data segment 
   msg db "Hello,world",0xa; a string
   len equ $-msg              ;stringth length
    
