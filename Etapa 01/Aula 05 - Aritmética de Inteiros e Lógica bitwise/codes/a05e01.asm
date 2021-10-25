; Aula 05 - Aritmética e Lógica
; arquivo: a05e01.asm
; objetivo: Adição e Subtração
; nasm -f elf64 a05e01.asm ; ld a05e01.o -o a05e01.x

section .text
    global _start

_start:

    mov eax, 10
    mov ebx, 20
    mov ecx, 30
    mov edx, -2
b1:
    add ebx, eax
    add edx, eax
b2:
    sub ecx, eax
    sub eax, ecx

fim:
    mov rax, 60
    mov rdi, 0
    syscall
