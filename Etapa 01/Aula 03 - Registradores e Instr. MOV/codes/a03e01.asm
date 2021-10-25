; Aula 03 - Registradores e MOV
; arquivo: a03e01.asm
; objetivo: acesso aos dados dos registradores e transferencias
; nasm -f elf64 a03e01.asm ; ld a03e01.o -o a03e01.x

section .data
    num: dq 0x7766554433221101

section .text
    global _start

_start:
    mov rax, [num]

fim:
    mov rax, 60
    mov rdi, 0
    syscall

