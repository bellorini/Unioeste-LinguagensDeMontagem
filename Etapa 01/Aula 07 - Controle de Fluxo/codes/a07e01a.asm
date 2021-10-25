; Aula 07 - Controle de Fluxo de Execucao
; arquivo: a07e01a.asm
; objetivo: laco de repeticao infinito
;           ctrl+c para finalizar
; nasm -f elf64 a07e01a.asm ; ld a07e01a.o -o a07e01a.x

section .bss
    destino: resq 1

section .text
    global _start

_start:
    ; play dead
    jmp _start      ; label é o destino
   
    ;mov rax, _start
    ;jmp rax        ; registrador contém destino

    ;mov qword [destino], _start
    ;jmp [destino]  ; variavel contém destino 

fim:
    mov rax, 60
    mov rdi, 0
    syscall
