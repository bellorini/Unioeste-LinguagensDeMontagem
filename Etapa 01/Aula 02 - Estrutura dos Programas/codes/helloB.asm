; Aula 02 - Estrutura dos Programas
;   herdado de Aula 01
; helloB.asm
; nasm -f elf64 helloB.asm ; ld helloB.o -o helloB.x

section .data
    strOla :  db "Ola", 10
    strOlaL:  equ $ - strOla

section .text
;    global _start

    mov rax, 60
    mov rdi, 0
    syscall

_start:
    mov rax, 1
    mov rdi, 1
    lea rsi, [strOla]
    mov edx, strOlaL
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
