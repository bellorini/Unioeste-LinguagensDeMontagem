; Aula 07 - Controle de Fluxo de Execucao
; arquivo: a07e05.asm
; objetivo: multiplicacao por somas sucessivas
;           lacos de repeticao em assembly
; nasm -f elf64 a07e05.asm ; ld a07e05.o -o a07e05.x

section .data
    ; variaveis inteiras
    multiplicando : dd 5;
    multiplicador : dd 13;

section .bss
    resultado : resd 1

section .text
    global _start:

_start:

; laco for iniciado =======================================
preFOR:
    ; setup da variavel de controle i (ecx)
    ; não eh usado variavel em memoria, mas sim registrador ecx
    mov ecx, [multiplicador]

    ; a soma sucessiva acontece em resultado com multiplicando
    ; desta forma, eh mais rapido usar registradores
    ; resultado -> eax, que ja eh zero
    ; multiplicando -> edx
    mov edx, [multiplicando]
entradaFOR:
    ; avaliacao de saida do FOR
    cmp ecx, 0
    jle saidaFOR
corpoFOR:
    ; bloco FOR de comandos
    add eax, edx
    ; ajuste da variavel de controle
    dec ecx
    ; retorno para verificar termino de laco
    jmp entradaFOR

saidaFOR:
    ; armazenar solucao em resultado
    mov [resultado], eax
; laco for finalizado =====================================

    ; use gdb
    ; ainda nao sabemos como transformar int para string
    ;   b fim
    ;   r
    ;   x /d &resultado
fim:
    mov rax, 60
    mov rdi, 0
    syscall
