 section .text                      ;code segment
         global main                    ;must be declared for linker
main:    ;tell linker entry point
         mov edx,len1              ;message length1
         mov ecx,msg1            ;message 1 to write
         mov ebx,1                 ;file descriptor (stdout)
         mov eax,4                 ;system call number (sys_write)
         int 0x80                    ;call kernel
         mov edx,len2              ;message length1
         mov ecx,msg2            ;message 2 to write
         mov ebx,1                 ;file descriptor (stdout)
         mov eax,4                 ;system call number (sys_write)
         int 0x80                    ;call kernel
         mov edx,len3              ;message length3
         mov ecx,msg3          ;message 3 to write
         mov ebx,1                 ;file descriptor (stdout)
         mov eax,4                 ;system call number (sys_write)
         int 0x80                    ;call kernel
         mov eax,1                 ;system call number (sys_exit)
         int 0x80                    ;call kernel
section .data                       ;data segment
         msg1     db 0xa,'Once upon a time, lions liked buffalos.',0xa; line 1
         len1     equ      $ - msg1          ; string length for line 1
         msg2     db 0xa,'The buffalos were not so social.',0xa; line 2
         len2     equ      $ - msg2         ; string length for line 2
         msg3     db 0xa,'A big fight ensued and the lions started to eat the Buffalos.',0xa,0xa; line 3
         len3     equ      $ - msg3         ; string length for line 3

         ; Note the segments/sections.
