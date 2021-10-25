; Aula 04 - Dados Nao-Inicializados e Estrutura
; arquivo: a04e02.asm
; objetivo: apresentar seção .bss e enderecos
; nasm -f elf64 a04e02.asm ; ld a04e02.o -o a04e02.x

section .data
    v1: db 0x61 
    v2: dd 0x65646362

section .bss
    n1: resb 1
    n2: resd 1
    n3: resb 1

section .text
    global _start

_start:
    mov al, [v1]
    lea r8, [v1]

    lea r9, [v2]

    mov rbx, [v2]
    mov rcx, [r9]    

    lea r10, [_start] ; mas o que!?
    lea r11, [fim]     

fim:
    mov rax, 60
    mov rdi, 0
    syscall
