; Aula 04 - Dados Nao-Inicializados e Estrutura
; arquivo: a04e05.asm
; objetivo: apresentar movimentacao com extensao de sinal
; nasm -f elf64 a04e05.asm ; ld a04e05.o -o a04e05.x

section .text
   global _start

_start:
   mov   eax, -100
   movsx rcx, eax

fim:
   mov rax, 60
   mov rdi, 0
   syscall
