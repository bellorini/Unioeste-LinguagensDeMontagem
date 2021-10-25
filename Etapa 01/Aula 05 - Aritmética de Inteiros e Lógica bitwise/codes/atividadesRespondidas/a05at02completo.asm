; Aula 05 - Aritmetica  e Lógica
; arquivo: a05at02completo.asm
; Atividade 02
; nasm -f elf64 a05at02completo.asm ; ld a05at02completo.o -o a05at02completo.x

section .data
    maiuscula : db 'a'
    minuscula : db 'B'

section .bss
    lowercase: resb 1
    uppercase: resb 1

section .text
    global _start

_start:
    ; Problema:
    ;   se maiuscula for um caractere minusculo, 
    ;   adicionar 0x20 resultara em outro caractere "esquisito"
    ;   assim, a soma/subtração nao eh a melhor forma de 
    ;   trocar a case de um caractere

    ; Solução:
    ;   escovar bits!
    ;   considere 'A' = 0x41 = 0100 0001 e
    ;             'a' = 0x61 = 0110 0001
    ;             diff           1
    ;
    ;   o 5o bit determina maiuscula(0) ou minuscula(1) na ASCII
    ;       esperto não?
    ;       pois operação lógica é muito mais rapido 
    ;       e simples do que ADD/SUB
    
    ; lowercase = tolowercase(maiuscula)
    ;   basta setar o 5o bit com OR 0010 0000
    mov al, [maiuscula]
    or al, 0x20
    mov [lowercase], al

    ; uppercase = touppercase(minuscula)
    ;   basta resetar o 5o bit com AND 1101 1111
    mov bl, [minuscula]
    and bl, 0xDF
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
