; Aula 07 - Controle de Fluxo de Execucao
; arquivo: a07e02.asm
; objetivo: laco de repeticao finito
; nasm -f elf64 a07e02.asm ; ld a07e02.o -o a07e02.x

section .data
    ; usado para converter índice r8 em caractere
    passo : db 0, 10 ; chr(r8) + "\n"

section .text
    global _start

_start:
    ; var de controle e estado inicial
    mov r8, 5 ; no. de execucoes
repete:
    ; codigo para imprimir o passo
    ; captura passo e transforma em char
    mov [passo], r8b
    add byte [passo], 0x30

    ; chamada WRITE
    mov rax, 1
    mov rdi, 1
    lea rsi, [passo]
    mov rdx, 2 ; char + quebra de linha
    syscall

    ; decrementar contador r8
    dec r8
    ; se r8 nao for zero, repete
    ; caso contrario, continua e finaliza
    jnz repete

fim:
    mov rax, 60
    mov rdi, 0
    syscall
