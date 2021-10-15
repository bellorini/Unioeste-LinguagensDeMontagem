; Aula 02 - Estrutura dos Programas
;   herdado de Aula 01
; helloC.asm
; nasm -f elf64 helloC.asm ; ld helloC.o -o helloC.x

section .data
    strOla :  db "Ola", 10
    strOlaL:  equ $ - strOla

section .text
    global _start ; reativado!!!

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
