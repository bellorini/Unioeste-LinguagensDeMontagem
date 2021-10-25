; Aula 07 - Controle de Fluxo de Execucao
; arquivo: a07e03.asm
; objetivo: Comparar v1 com v2
;           Informar resultado  
; nasm -f elf64 a07e03.asm ; ld a07e03.o -o a07e03.x

section .data
   maior    : db "v1 eh maior do que v2", 10
   menor    : db "v1 eh menor do que v2", 10
   mTamanho : equ $-menor

   iguais   : db "v1 eh igual a v2", 10
   iTamanho : equ $-iguais

   d1 : db "Entre com único digito v1: "
   d2 : db "Entre com único digito v2: "
   dTamanho : equ $-d2

section .bss
   v1: resb 2 ; 2 char, antecipando "enter"
   v2: resb 2 ; 

section .text
   global _start

_start:

   ; entrada de v1
   mov rax, 1
   mov rdi, 1
   lea rsi, [d1]
   mov edx, dTamanho
   syscall

   ; leitura de v1
   mov rax, 0
   mov rdi, 1
   lea rsi, [v1]
   mov rdx, 2 ; enter
   syscall

   ; entrada de v2
   mov rax, 1
   mov rdi, 1
   lea rsi, [d2]
   mov edx, dTamanho
   syscall

   ; leitura de v2
   mov rax, 0
   mov rdi, 1
   lea rsi, [v2]
   mov rdx, 2 ; enter
   syscall

   ; compara v1 com v2 (valores ASCII)
   mov al, [v1]
   cmp al, [v2]
   je lIguais ; v1 = v2 ; observação: linha opcional
   jl lMenor  ; v1 < v2
   jg lMaior  ; v1 > v2

lIguais:
   mov rax, 1
   mov rdi, 1
   lea rsi, [iguais]
   mov edx, iTamanho
   syscall   
   jmp fim  ; se acessou esta perna, não pode continuar

lMenor:
   mov rax, 1
   mov rdi, 1
   lea rsi, [menor]
   mov edx, mTamanho
   syscall
   jmp fim  ; se acessou esta perna, não pode continuar

lMaior:
   mov rax, 1
   mov rdi, 1
   lea rsi, [maior]
   mov edx, mTamanho
   syscall
   jmp fim  ; observação: linha logicamente opcional

fim:
   mov rax, 60
   mov rdi, 0
   syscall
