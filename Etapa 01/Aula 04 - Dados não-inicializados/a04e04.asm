; Aula 04 - Dados Nao-Inicializados e Estrutura
; arquivo: a04e04.asm
; objetivo: apresentar decimais negativos
; nasm -f elf64 a04e04.asm ; ld a04e04.o -o a04e04.x

section .data
   v1: dq  100d
   v2: dq -100d

section .text
   global _start
 
_start:
    ; gdb x /[bhwg][cduxto]
fim:
   mov rax, 60
   mov rdi, 0
   syscall
