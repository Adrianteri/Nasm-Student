; Example 7: find the largest of three numbers. The variables are double-digit variables. The three
; variables num1, num2 and num3 have values 35, 21 and 41 respectively:
;
section .text
     global main               ;must be declared for using gcc
main:      ;tell linker entry point
           mov     ecx, [num1]
           cmp     ecx, [num2]
           jg      check_third_num
           mov     ecx, [num3]
    check_third_num:
           cmp     ecx, [num3]
        jg    value_exit
        mov   ecx, [num3]
value_exit:
        mov   [largest],  word ecx
        mov   ecx,msg
        mov   edx, len
        mov   ebx,1       ;file descriptor (stdout)
        mov   eax,4       ;system call number (sys_write)
        int   0x80        ;call kernel
;nwln
        mov   ecx,largest
        mov   edx, 2
        mov   ebx,1       ;file descriptor (stdout)
        mov   eax,4       ;system call number (sys_write)
        int   0x80        ;call kernel
        mov   eax, 1
        int   80h
section .data
    msg db "The largest digit is: ", 0xA,0xD
    len equ $- msg
    num1 dd '47'
    num2 dd '72'
    num3 dd '31'
segment .bss
   largest resb 4
; run this program and explain how it works.
