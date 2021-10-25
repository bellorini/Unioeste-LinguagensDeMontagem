; Aula 05 - Aritmetica  e Lógica
; arquivo: a05at01completo.asm
; Atividade 01
; nasm -f elf64 a05at01completo.asm ; ld a05at01completo.o -o a05at01completo.x

section .data
    maiuscula : db 'A'
    minuscula : db 'b'

section .bss
    lowercase: resb 1
    uppercase: resb 1

section .text
    global _start

_start:
    ; Na tabela ASCII, 
    ;   a diferença entre um caractere maiúsculo para 
    ;   seu par minúsculo é de +0x20 (32d)
    ; Exemplo: 'A' = 0x41 e 'a' = 0x61
    
    ; lowercase = tolowercase(maiuscula)
    ;   basta somar 0x20
    mov al, [maiuscula]
    add al, 0x20
    mov [lowercase], al

    ; uppercase = touppercase(minuscula)
    ;   basta subtrair 0x20
    mov bl, [minuscula]
    sub bl, 0x20
    mov [uppercase], bl

    ; para gdb:
    ;   b fim
    ;   r
    ;   x/c &maiuscula
    ;   x/c &minuscula
    ;   x/c &lowercase
    ;   x/c &uppercase
fim:
    mov rax, 60
    mov rdi, 0
    syscall
