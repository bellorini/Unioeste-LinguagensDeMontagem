; Aula 06 - Chamada de Sistemas
; arquivo: a06at01.asm
; Atividade 01
; nasm -f elf64 a06at01completo.asm ; ld a06at01completo.o -o a06at01completo.x

section .data
    saidaProblema  : db "this isn't working!", 10, 0
    saidaProblemaL : equ $-saidaProblema
    

section .text
    global _start

_start:
    ; get PID
    mov rax, 0x27
    syscall
    
    ; salvar PID pois RAX sera sobrescrito
    ; sera que podemos fazer diferente? 
    ;    a ordem com que os parametros sao preenchidos eh importante?
    ;    uhm ... e se passar RAX diretamente para o RDI e 
    ;            depois ajustar somente o RAX e RSI?
    mov r8, rax

    ; kill PID
    mov rax, 0x3e
    mov rdi, r8
    mov rsi, 9
    ;syscall ; descomentar esta linha para funcionar!

    ; Se nao funcionar, imprime que nao funcionou!
    mov rax, 1  ; WRITE
    mov rdi, 1
    lea rsi, [saidaProblema]
    mov edx, saidaProblemaL
    syscall

fim:
    mov rax, 60
    mov rdi, 0
    syscall
