; clear screen write: \x1b[2J  also fix cursor position using: \x1b[H
; written on 01/11/2013 for 2013 class in ALP at UoN
global  main
_start:
main:

section .text

  mov eax, 4
  mov ebx, 1
  mov ecx, clr
  mov edx, clrlen
  int 0x80

  mov eax, 1
  mov ebx, 0
  int 0x80

section .data
  clr    db 0x1b, "[2J", 0x1b, "[H"
  clrlen equ $ - clr

