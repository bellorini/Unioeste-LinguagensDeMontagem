; Aula 09 - Pilha e Parâmetros do S.O.
; arquivo: a09at01.asm
; Atividade 01: lmrename

; nasm -f elf64 a09at01.asm ; ld a09at01.o -o a09at01.x

section .bss
    ; ponteiros para strings
    arq1 : resb 255 ; nomeVelho
    arq2 : resb 255 ; nomeNovo

section .text
    global _start

_start:

    pop rdx ; argc

    pop rdx ; nome arquivo

    pop r14 ; ponteiro temporario para nomeVelho
    pop r15 ; ponteiro temporario para nomeNovo

   
copiaStrArq1:
    mov r8b, [r14+r10]
    mov [arq1+r10], r8b

    inc r10

    cmp r8b, 0
    jne copiaStrArq1   

    xor r10, r10

copiaStrArq2:
    mov r8b, [r15+r10]
    mov [arq2+r10], r8b

    inc r10

    cmp r8b, 0
    jne copiaStrArq2

lmrenameEmAcao:
    ; int rename(const char *oldpath, const char *newpath);
    ; eax rename(arq1, arq2)
    mov rax, 0x52
    mov rdi, arq1
    mov rsi, arq2
    syscall

fim:
    mov rax, 60
    mov rbx, 0
    syscall

   
