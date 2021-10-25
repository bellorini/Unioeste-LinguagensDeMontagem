; Aula 07 - Controle de Fluxo de Execucao
; arquivo: a07e01b.asm
; objetivo: laco de repeticao infinito
;           ctrl+c para finalizar
; nasm -f elf64 a07e01b.asm ; ld a07e01b.o -o a07e01b.x

section .data
    msg  : db "Onde está o JUMP?", 10, 0
    msgL : equ $-msg

section .bss
    destino: resq 1

section .text
    global _start

_start:
    ;jmp fim      ; não executa WRITE
   
    mov rax, 1  ; WRITE
    mov rdi, 1
    lea rsi, [msg]
    mov edx, msgL
    syscall

fim:
    mov rax, 60
    mov rdi, 0
    syscall
