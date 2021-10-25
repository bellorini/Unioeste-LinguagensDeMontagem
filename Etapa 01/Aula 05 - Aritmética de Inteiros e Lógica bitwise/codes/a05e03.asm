; Aula 05 - Aritmética e Lógica
; arquivo: a05e03.asm
; objetivo: Instruções Lógicas
; nasm -f elf64 a05e03.asm ; ld a05e03.o -o a05e03.x

section .data
    v1: dw 0xfff9 ; 1111.1111 1111.1001
    v2: dw 0xaaaa ; 1010.1010 1010.1010

section .bss
    v1orv2:  resw 1
    v1andv2: resw 1
    v1xorv2: resw 1

section .text
    global _start

_start:
    mov ax, [v1]
    mov bx, [v2]
    mov cx, [v2]

    ; or reg x reg
    or cx, ax

    ; or mem x reg
    mov [v1orv2], ax
    or  [v1orv2], bx

    ; or reg, imm
    or bx, 0x00ff

band:
    ; and
    mov ax, [v1]
    mov bx, [v2]
    mov cx, [v2]

    ; and reg x reg
    and cx, ax

    ; and mem x reg
    mov [v1andv2], ax
    and [v1andv2], bx

    ; and reg, imm
    and bx, 0x00ff

bxor:
    ; xor
    mov ax, [v1]
    mov bx, [v2]
    mov cx, [v2]   

    ; xor reg x reg
    xor cx, ax

    ; xor mem x reg
    mov [v1xorv2], ax
    xor [v1xorv2], bx

    ; xor reg, imm
    xor bx, 0x00ff

bnotneg:
    mov r8w, 0xffff ; -1
    mov r9w, 0xffff ; -1
    not r8w
    neg r9w

fim:
    mov rax, 60
    mov rdi, 0
    syscall


