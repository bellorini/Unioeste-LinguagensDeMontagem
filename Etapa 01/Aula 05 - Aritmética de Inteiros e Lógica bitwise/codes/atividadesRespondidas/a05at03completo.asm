; Aula 05 - Aritmetica  e Lógica
; arquivo: a05at03completo.asm
; Atividade 03
; nasm -f elf64 a05at03completo.asm ; ld a05at03completo.o -o a05at03completo.x

section .data
    triangularNum : dd 0, 1, 3, 6, 10, 15, 21, 28

section .bss
    somatorio : resd 1

section .text
    global _start

_start:
    ; É necessário "passear" no vetor acumulando elementos
    ;   EAX: acumulador 
    ;   RBX: endereco do numero triangular a ser acumulado
    ;   RCX: indexador
    ;   ainda não temos lacos de repeticao :(

    ; EAX e RCX iniciam em zero
    ; usa-se LEA para calcular endereco
    ; cada inteiro está 4 bytes do seu vizinho anterior

    ; acumulador += triangularNum[0]
    lea rbx, [triangularNum + rcx*4]
    add eax, [rbx]
    
    ; acumulador += triangularNum[1]
    inc rcx
    lea rbx, [triangularNum + rcx*4]
    add eax, [rbx]

    ; acumulador += triangularNum[2]
    inc rcx
    lea rbx, [triangularNum + rcx*4]
    add eax, [rbx]

    ; acumulador += triangularNum[3]
    inc rcx
    lea rbx, [triangularNum + rcx*4]
    add eax, [rbx]

    ; acumulador += triangularNum[4]
    inc rcx
    lea rbx, [triangularNum + rcx*4]
    add eax, [rbx]

    ; acumulador += triangularNum[5]
    inc rcx
    lea rbx, [triangularNum + rcx*4]
    add eax, [rbx]

    ; acumulador += triangularNum[6]
    inc rcx
    lea rbx, [triangularNum + rcx*4]
    add eax, [rbx]

    ; acumulador += triangularNum[7]
    inc rcx
    lea rbx, [triangularNum + rcx*4]
    add eax, [rbx]

    ; resultado do somatorio em EAX
    ;   mover para [somatorio]
    mov [somatorio], eax

    ; para gdb
    ;   b fim
    ;   r
    ;   x /d &somatorio

    ; lacos de repeticao -> aula 07!

fim:

    mov rax, 60
    mov rdi, 0
    syscall
