SECTION.txt
   global main      ;must be declared for the linker(id)

       main:        ;tell linker entry point of code section
            ; write th name 'Nyag Sus'

            mov  edx,10       ;message length
            mov  ecx,name     ;message to write
            mov  ebx,1        ;file descriptor(stdout) 
            mov  eax,4        ;system call number(sys_write)
            int 80h           ;call kernel sys
            
        ;write the name 'Wanj Sus'
            
            mov edx,8         ;message length
            mov ecx,name      ;message to write
            mov ebx,1         ;file descriptor(stdout)
            mov eax,4         ;system call number(sys_write)
            int 80h           ;call kernel

SECTION.data
   
   name db'Nyag Sus';                       
