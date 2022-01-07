; Aula 09 - Parâmetros do S.O.
; arquivo: a09e03.asm
; nasm -f elf64 a09e03.asm ; ld a09e03.o -o a09e03.x

; apresenta parâmetros de entrada via terminal
;   caracter a caracter
; uso: ./a09e03.x parametro1 parametro2 parametro3 ...

section .data
    nomeP : db 10, 'Nome do programa: '
    strl1 : equ $-nomeP
    param : db 10, 'param           : ' ; LF antecipado
    strl2 : equ $-param

    lf    : db 10,10    ; quebra-de-linha dupla

section .bss
    temp : resb 1  ; char para impressao
    noPa : resq 1  ; numero de parametros

section .text
    global _start

_start:
    xor r9, r9

    pop qword [noPa]  ; no. de parametros em noPa -- argc

    mov rax, 1 ; write
    mov rdi, 1
    mov rsi, nomeP
    mov rdx, strl1 
    syscall

printSaida:
    pop r15   			; parametro *string
    xor r9,r9           ; indexador da string
laco:
    mov r8b, [r15+r9]	; caractere a ser impresso
    cmp r8b, 0          ; null-char
    je testaParam		; terminou a string?

laco2:

    mov [temp], r8b
    mov rax, 1 ; write
    mov rdi, 1
    mov rsi, temp                   ; 2021 - usar LEA
    mov rdx, 1 ; char-a-char
    syscall

    inc r9d
    jmp laco				; próximo caractere


testaParam:
    dec qword [noPa]
    ; cmp qword [noPa], 0 ; desnecessario, pois DEC ajusta flags
    jz fim				; se zero, então terminou!
    mov rax, 1 ; write
    mov rdi, 1
    mov rsi, param
    mov rdx, strl2
    syscall

    jmp printSaida

fim:
    mov rax, 1 ; write
    mov rdi, 1
    mov rsi, lf
    mov rdx, 2 ; lf dupla
    syscall

    mov rax, 60
    mov rdi, 0
    syscall
