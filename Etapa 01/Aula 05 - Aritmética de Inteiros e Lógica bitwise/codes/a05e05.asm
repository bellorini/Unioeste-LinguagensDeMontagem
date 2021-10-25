; Aula 05 - Aritmética e Lógica
; arquivo: a05e05.asm
; objetivo: Deslocamento Lógico SHR e SHL
; nasm -f elf64 a05e05.asm ; ld a05e05.o -o a05e05.x

section .text
    global _start

_start:
    mov al, 0x81 ; 1000 0001
toshl:
    sal al, 1
    ; CF = 1

toshr:
    ; al = 0000 0010
    sar al, 1
    ; al = 0000 0001
    ; CF = 0

todivideby:
    mov ebx, -200
todivideby2: ; 2^1
    sar ebx, 1    
todivideby4: ; 2^2
    sar ebx, 2
todivideby8: ; 2^3
    sar ebx, 3 

tomultiplyby:
    mov ebx, -25
tomultiplyby2: ; 2^1
    sal ebx, 1
tomultiplyby4: ; 2^2
    sal ebx, 2 
tomultiplyby32: ; 2^5
    sal ebx, 5

fim:
    mov rax, 60
    mov rdi, 0
    syscall
