; Aula 10 - Subprogramas
; arquivo: a10e05.asm
; objetivo: demonstrar chamada de funções externas printf
; nasm -f elf64 a10e05.asm ; gcc -m64 -no-pie a10e05.o -o a10e05.x

%define _exit   60

section .data
    strCtrl : db "%s, is a science fiction television series that premiered in the United States and Canada on September %d, %d", 10, 0 ; null-terminated
    str1    : db "Firefly", 0 ; null-terminated
    day     : dd 20
    year    : dd 2002 

extern printf

section .text
    global main

main:
    ; main é função, cuidar da pilha!
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; não será salvo registradores

    ; não será passado ponto-flutuante
    xor rax,rax      ; número de registradores xmm0 é zero

    ; printf("%s, is a science fiction television series that premiered in the United States and Canada on September %d, %d", stri, day, year);
    ; carrega parâmetros da esquerda para direita nos registradores
    ; RDI, RSI, RDX, RCX
    mov rdi, strCtrl ; string de controle para printf
    lea rsi, [str1]  ; endereço para string 'umaStr'
    mov edx, [day] ; conteúdo do inteiro 'day'
    mov ecx, [year]; condeúdo do inteiro 'year'
    call printf

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall
