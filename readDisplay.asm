; read and display a name; 


section .text
global main   ;must be declared for using gcc
main: ;tell linker entry point

; display request to  enter the name
mov  ecx,msg1
mov  edx, len1
mov  ebx,1 ;file descriptor (stdout)
mov  eax,4 ;system call number (sys_write)
int  0x80 ;call kernel

; read in the name
mov  ecx,ename
mov  edx, 20
mov  ebx,2 ;file descriptor (stdout)
mov  eax,3 ;system call number (sys_read)
int  0x80 ;call kernel

; display what is read
; display  the name remark
mov  ecx,msg2
mov  edx, len2
mov  ebx,1 ;file descriptor (stdout)
mov  eax,4 ;system call number (sys_write)
int  0x80 ;call kernel

; display what was read
mov  ecx,ename
mov  edx, 20
mov  ebx,1 ;file descriptor (stdout)
mov  eax,4 ;system call number (sys_write)
int  0x80 ;call kernel
; display new line
mov  ecx,nwLine;
mov  edx, 2
mov  ebx,2 ;file descriptor (stdout)
mov  eax,3 ;system call number (sys_read)
int  0x80 ;call kernel

;exit
mov  eax,1 ;system call number (sys_exit)
int  0x80 ;call kernel

section .data
msg1 db 10,"Please enter the name: "; request name
len1 equ $- msg1
msg2 db 10,10,"The name is: "; display name
len2 equ $- msg2
nwLine db 10,10; new line or curriage returen




segment .bss
ename  resb 20 ; run this program and explain how it works