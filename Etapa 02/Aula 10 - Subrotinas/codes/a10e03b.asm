; Aula 10 - Subprogramas
; arquivo: a10e03.asm
; objetivo: chamada de sub-programas em x64
; nasm -f elf64 a10e03.asm ; ld a10e03.o -o a10e03.x

; sub-programa para encontrar o tamanho de string null-terminated
; assinatura em C:
;     int strLength(char *c[]);

; utiliza arquivo externo

%define _write  1
%define _exit   60

section .data
    strTeste1 : db "string null-terminated", 0       ; 22 + 1
    strTeste2 : db "outra string null-terminated", 0 ; 28 + 1
    strTeste3 : db "But it ain't all buttons and charts, little albatross. You know what the first rule of flyin' is? Love. You can know all the math in the 'Verse, but take a boat in the air you don't love, she'll shake you off just as sure as the turning of worlds. Love keeps her in the air when she oughta fall down, tells ya she's hurtin' 'fore she keens. Makes her home.", 0                  ; 356 + 1                ; 11 + 1

section .bss
    str1L : resd 1
    str2L : resd 1
    str3L : resd 1

section .text
    global _start

_start:
    ; valores para teste de salvamento de registradores
    mov rax, 1
    mov rbx, 2
    mov rcx, 3
    mov rdx, 4
    mov r8 , 5
    mov r9 , 6
    mov r10, 7
    mov r11, 8
    mov r12, 9
    mov r13, 10
    mov r14, 11
    mov r15, 12
    mov rdi, 13
    mov rsi, 14

    ; passo 1 - Antes da chamada CALL
    ; salvar registradores RAX, RCX, RDX, R8 - R11
    push rax
    push rcx
    push rdx
    push r8
    push r9
    push r10
    push r11

    ; passo 2 - Antes da chamada CALL
    ; Passagem de parâmetros
    mov rdi, strTeste1

    ; passo 3 - chamada CALL
    call strLength

    ; retorno do sub-programa em EAX
    mov [str1L], eax ; inteiro de 32bit

    ; passo 4
    ; remover parâmetros da PILHA
    ; add rsp, 8 ; +8 para cada parâmetro empilhado
                 ; porém não existem neste exemplo
                 ; 90% dos códigos utilizam até 6 parâmetros

    ; passo 5
    ; recuperar registradores RAX, RCX, RDX, R8 - R1
    pop r11 ; último empilhado
    pop r10
    pop r9
    pop r8
    pop rdx
    pop rcx
    pop rax  ; primeiro empilhado

fim:
    mov rax, _exit
    mov rdi, 0
    syscall

;%include "a10e03bstrLengh.asm"
%include "a10e03bfuncoes/a10e03bstrLengh.asm"
