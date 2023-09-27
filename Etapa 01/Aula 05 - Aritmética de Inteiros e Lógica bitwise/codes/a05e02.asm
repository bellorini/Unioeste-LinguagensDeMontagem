; Aula 05 - Aritmética e Lógica
; arquivo: a05e02.asm
; objetivo: Carry e Overflow
; nasm -f elf64 a05e02.asm ; ld a05e02.o -o a05e02.x

section .text
    global _start

_start:
    mov ax, 0x7fff ; 32767 ;uint
    mov bx, 0xffff ; 65535 ;uint

overflow:
    add ax, 1 ; -32768     ;int

carry:
    add bx, 1 ; 0 e carry 1 no 17º bit

fim:
    mov rax, 60
    mov rdi, 0
    syscall
