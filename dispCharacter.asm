; dsiiplay only one character


section .text
global main   ;must be declared for using gcc
main: ;tell linker entry point

; display a character
mov  ecx,msg+5
mov  edx, 1
mov  ebx,1;file descriptor (stdout)
mov  eax,4;system call number (sys_write)
int  0x80;call kernel

; display new line
mov  ecx,nwLine;
mov  edx, 2
mov  ebx,1 ;file descriptor (stdout)
mov  eax,4 ;system call number (sys_read)
int  0x80 ;call kernel

;exit
mov  eax,1 ;system call number (sys_exit)
int  0x80 ;call kernel

section .data
msg db 10,"Please enter the name: "; request name
len equ $- msg
nwLine db 10,10; new line
