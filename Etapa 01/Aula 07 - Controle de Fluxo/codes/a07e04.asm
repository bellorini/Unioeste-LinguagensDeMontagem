; Aula 07 - Controle de Fluxo de Execucao
; arquivo: a07e04.asm
; objetivo: the evil lowercase papagali code!
;           verifica entrada 
;             se length < 25
;               converte string de entrada para lowercase
;               apresenta conversao
;             senao
;               msg de erro e encerra
; nasm -f elf64 a07e04.asm ; ld a07e04.o -o a07e04.x

%define maxChars 26

section .data
    strOla : db "Hello? (max 25 caracteres)", 10, 0
    strOlaL: equ $ - strOla     

    strBye : db "Voce digitou: ", 0
    strByeL: equ $ - strBye

    strErro : db "Voce digitou mais do que 25 caracteres", 10, "Programa encerrado", 10, 0
    strErroL: equ $ - strErro

    strLF  : db 10 ; quebra de linha
    strLFL : db 1

section .bss
    strLida  : resb maxChars
    strLidaL : resd 1

section .text
	global _start

_start:
    mov rax, 1
    mov rdi, 1  ; std_file
    lea rsi, [strOla]
    mov edx, strOlaL
    syscall

leitura:
    mov rax, 0  ; READ
    mov rdi, 1
    lea rsi, [strLida]
    mov edx, maxChars
    syscall

    mov [strLidaL], eax

verificacaoDeEntrada:
    ; [strLida + eax-1] aponta para ultimo lido
    ; se ultimo for enter
    ;   laco para lowercase
    cmp byte [strLida + eax-1], 10
    je entradaFor
    ; senao 
    ;   msg de erro e encerra.
    mov rax, 1  ; WRITE
    mov rdi, 1
    mov rsi, strErro
    mov rdx, strErroL
    syscall    
    jmp fim

; for(ecx = 0; ecx < strLidaL; ecx++){ ... }
entradaFor:
    mov ecx, 0           ; ecx = 0
    mov r8d, [strLidaL]  ; reg eh rapido
    dec r8d

    preBloco:               
        cmp ecx, r8d ; ecx < strLidaL
        jge saidaFor
    blocoFor:
        ; acessa String e aplica lowercase byte-a-byte
        or byte [strLida + ecx], 0x20
        inc ecx                 ; ecx++
        jmp preBloco


saidaFor:
resposta:
    mov rax, 1  ; WRITE
    mov rdi, 1
    lea rsi, [strBye]
    mov edx, strByeL
    syscall

    mov rax, 1  ; WRITE
    mov ebx, 1
    lea rsi, [strLida]
    mov edx, [strLidaL]
    syscall

fim:
    mov rax, 60
    mov rdi, 0
    syscall
