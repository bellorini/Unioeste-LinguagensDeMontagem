; Aula 01 - Introdução
; hello.asm
; Meu primeiro assembly!
; nasm -f elf64 hello.asm ; ld hello.o -o hello.x

section .data
   strOla :  db "Ola", 10
   strOlaL:  equ $ - strOla

section .text
	global _start

_start:
   mov rax, 1
   mov rdi, 1
   lea rsi, [strOla]
   mov edx, strOlaL
   syscall

   mov rax, 60
   mov rdi, 0
   syscall
