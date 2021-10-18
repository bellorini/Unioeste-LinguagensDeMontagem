; Aula 04 - Dados Nao-Inicializados e Estrutura
; arquivo: a04a01.asm
; Atividade
; nasm -f elf64 a04a01.asm ; ld a04a01.o -o a04a01.x

section .data
    ; vetor largura, altura e profundidade
    dimensoes : dw 50, 65, -75

section .bss
    volume : resq 1

section .text
    global _start

_start:
    ; aluno deve:
        ; mover largura para registrador r8?
        ; mover altura para registrador r9?
        ; mover profundidade para registrador r10?
        ; ter cuidado com os tamanhos dos registradores

    ; coloque seu código aqui!
    ; coloque seu código aqui!
    ; coloque seu código aqui!

    ; código base para o cálculo, não alterar!
        xor dx, dx
        mov ax, r8w
        imul r9w
        imul r10w
        
        mov cx, dx
        shl ecx, 16
        mov cx, ax
        ; resposta 
        ; volume = dimensoes[0] * dimensoes[1] * dimensoes[2]
        ; ecx = volume

    ; aluno deve:
        ; mover resultado ecx para volume
        ; cuidado com o sinal

    ; coloque seu código aqui!
    ; coloque seu código aqui!

fim:
    mov rax, 60
    mov rdi, 0
    syscall



