; Aula 05 - Aritmetica  e Lógica
; arquivo: a05at04completo.asm
; Atividade 03
; nasm -f elf64 a05at04completo.asm ; ld a05at04completo.o -o a05at04completo.x

section .data
    n : dd 40

section .bss
    enessimotrinumero : resd 1

section .text
    global _start

_start:
    ; o número triangular na posição p é dado por:
    ;   (n * (n + 1) ) / 2

    ; EAX = (n + 1)
    mov eax, [n]
    inc eax

    ; (n * (n + 1) )
    ;   eax já contém (p + 1)
    ;   edx é zero
    imul eax, [n]

    ; (n * (n + 1) ) / 2
    mov ecx, 2  ; idiv não suporta imm
    idiv ecx

    ; mover resultado para enessimotrinumero
    mov [enessimotrinumero], eax

    ; para gdb
    ;   b fim
    ;   r
    ;   x /d &enessimotrinumero

fim:

    mov rax, 60
    mov rdi, 0
    syscall
