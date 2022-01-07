; Aula 09 - Demonstração de uso básico da Pilha
; arquivo: a09e01b.asm
; nasm -f elf64 a09e01b.asm ; ld a09e01b.o -o a09e01b.x

; Lê do teclado e escreve no terminal o que foi lido
; não usa variável para tamanho lido
;   sempre imprime 255 caracteres, incluindo lixo!
;   adicionado um laço de repetição para causar este bug
; limite de entrada máxima
%define maxChars 255

section .data
    strOla  : db "Entrada (max 20 char): ",0
    strBye  : db "Vc digitou           : ",0 ; padding para strByeL 
    strByeL : equ $-strBye

section .bss
    strLida : resb maxChars ; "char + enter"

section .text
    global _start

_start:
    ; write
    mov rax, 1
    mov rdi, 1
    mov rsi, strOla
    mov rdx, strByeL ; mesmo tamanho
    syscall

    ; read
    mov rax, 0
    mov rdi, 1
    mov rsi, strLida
    mov rdx, maxChars
    syscall

; avalia final de execucao
    cmp byte [strLida], 0xa ; quebra de linha, entrada vazia
    je fim

    ; guarda no. chars lidos na pilha
    push rax 

    ; write
    mov rax, 1
    mov rdi, 1
    mov rsi, strBye
    mov rdx, strByeL ; mesmo tamanho
    syscall    
 
    ; write
    mov rax, 1
    mov rdi, 1
    mov rsi, strLida

    ; retorna no. de chars lidos 
    ; parâmetro rdx para a chamada write
    ; pop rdx             

    ; para causar bug, mude pop rdx para mov rdx, maxChars
    mov rdx, maxChars

    syscall 

    jmp _start 

fim:
    mov rax, 60
    mov rdi, 0
    syscall
