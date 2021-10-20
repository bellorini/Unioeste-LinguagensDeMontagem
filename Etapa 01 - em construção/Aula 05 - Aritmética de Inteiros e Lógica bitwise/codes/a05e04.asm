; Aula 05 - Aritmética e Lógica
; arquivo: a05e04.asm
; objetivo: Deslocamento Lógico SHR e SHL
; nasm -f elf64 a05e04.asm ; ld a05e04.o -o a05e04.x

section .text
    global _start

_start:
    mov al, 0x81 ; 1000 0001
toshl:
    shl al, 1
    ; CF = 1

toshr:
    ; al = 0000 0010
    shr al, 1
    ; al = 0000 0001
    ; CF = 0

todivideby:
    mov ebx, 200
todivideby2: ; 2^1
    shr ebx, 1    
todivideby4: ; 2^2
    shr ebx, 2
todivideby8: ; 2^3
    shr ebx, 3 

tomultiplyby:
    mov ebx, 25
tomultiplyby2: ; 2^1
    shl ebx, 1
tomultiplyby4: ; 2^2
    shl ebx, 2 
tomultiplyby32: ; 2^5
    shl ebx, 5

fim:
    mov rax, 60
    mov rdi, 0
    syscall
