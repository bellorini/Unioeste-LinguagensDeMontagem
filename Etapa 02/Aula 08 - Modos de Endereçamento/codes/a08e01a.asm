; Aula 08 - Demonstração de Instrução MOV
; arquivo: a08e01a.asm
; nasm -f elf64 a08e01a.asm ; ld a08e01a.o -o a08e01a.x

; comparar com: cmp -l a08e01a.x a08e01b.x | gawk '{printf "%08X %02X %02X\n", $1-1, strtonum(0$2), strtonum(0$3)}'

section .text
    global _start
_start:
    mov eax, ebx
fim:
    mov rax, 60
    mov rdi, 0
    syscall
