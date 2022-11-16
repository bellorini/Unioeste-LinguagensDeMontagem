; Aula 06 - Chamada de Sistemas
; arquivo: at06e01.asm
; objetivo: aplicação sem sentido!
; nasm -f elf64 at06e01.asm ; ld at06e01.o -o at06e01.x

section .data
   saida:   db "this isn't working!",10
   saidaL: equ $ - saida

section .bss

section .text
   global _start

_start:

   ; aqui deve ser inserido código da aplicação 'sem sentido'

   ; recomendação de parâmetro: use 9 (SIGKILL)

   mov rax, 1
   mov rdi, 1
   mov rsi, saida
   mov rdx, saidaL
   syscall

fim:
   mov rax, 60
   mov rdi, 0
   syscall
