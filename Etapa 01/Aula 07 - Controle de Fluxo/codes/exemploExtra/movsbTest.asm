; Aula 07 - Controle de Fluxo de Execucao
; arquivo: movsbTest.asm
; objetivo: cópia de mem -> mem
;           usando sufixo REP + MOVSB
;           REP  : repete uma instrução ECX vezes
;           MOVSB: cópia de Byte de *rsi para *rdi
;                  legado
;                  variações: MOVSW, MOVSD, MOVSQ
; nasm -f elf64 movsbTest.asm ; ld movsbTest.o -o movsbTest.x

section .data
    strIn  : db "teste de string",0
    strInL : equ $-strIn

section .bss
    strOut : resb strInL

section .text
    global _start

_start:
    ; breakpoints sugeridos:
    ;   vamosCopiar
    ;   fim

    ; ajusta ecx para strIn.Len()
    mov ecx, strInL

    ; verificar via gdb
    ;   x /s &strIn
    ;   x /s &strOut
vamosCopiar:
    ; ajusta ponteiros fonte (rsi) e destino (rdi)
    mov rsi, strIn
    mov rdi, strOut
    ; executa cópia de memória
    ; obs: operandos implícitos
    rep movsb

    ; verificar via gdb
    ;   x /s &strIn
    ;   x /s &strOut
fim:
    mov rax, 60
    mov rsi, 0
    syscall

