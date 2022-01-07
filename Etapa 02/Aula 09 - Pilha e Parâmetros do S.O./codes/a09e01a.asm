; Aula 09 - Demonstração de uso básico da Pilha
; arquivo: a09e01a.asm
; nasm -f elf64 a09e01a.asm ; ld a09e01a.o -o a09e01a.x

; Lê do teclado e escreve no terminal o que foi lido
; não usa variável para tamanho lido
;   usa push -> pop para salvar temporáriamente na pilha
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

l1:
    ; guarda no. chars lidos na pilha
    push rax 

l2:
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
l3:
    ; retorna no. de chars lidos 
    ; parâmetro rdx para a chamada write
    pop rdx             
l4:
    syscall  

fim:
    mov rax, 60
    mov rdi, 0
    syscall
