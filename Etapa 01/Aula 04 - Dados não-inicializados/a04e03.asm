; Aula 04 - Dados Nao-Inicializados e Estrutura
; arquivo: a04e03.asm
; objetivo: apresentar "tipos de dados"
; nasm -f elf64 a04e03.asm ; ld a04e03.o -o a04e03.x

section .data
   v1: dq 0x61
   v2: dq 97d
   v3: dq 141o
   v4: dq 1100001b

section .text
   global _start

_start:
    ; gdb x /[bhwg][cduxto]
fim:
   mov rax, 60
   mov rdi, 0
   syscall
