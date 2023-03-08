; Aula 08 - Demonstração dos modos de endereçamento
; arquivo: a08e02.asm
; nasm -f elf64 a08e02.asm ; ld a08e02.o -o a08e02.x

section .data
    var : dd 0x42, 0x404, 0x2022 ; vetor var = [0x42, 0x404, x02022]

section .bss
    ponteiro : resq 1

section .text
    global _start
_start:
;----------------------
    xor eax, eax
Imediato:
    mov eax, 0x42
ImediatoP:
;----------------------
    xor eax, eax
Direto:
    mov eax, [var]
DiretoP:
;----------------------
    xor eax, eax
IndiretoTeorico:
    mov qword [ponteiro], var
    mov eax, [ponteiro]
IndiretoTeoricoP:
;----------------------
    xor eax, eax
    mov ebx, 0x13
Registrador:
    mov eax, ebx
RegistradorP:
;----------------------
    xor eax, eax
    lea r8, [var]   ; end. buscado/calculado previamente
IndiretoRegistrador:
    mov eax, [r8]
IndiretoRegistradorP:
;----------------------
    xor eax, eax
; Deslocamento pode ser qualquer valor inteiro
PorDeslocamento1:
    mov eax, [var+4]
PorDeslocamento1P:
;----------------------
    xor eax, eax
    lea r8, [var]
PorDeslocamento2:
    mov eax, [r8+4]
PorDeslocamento2P:
;----------------------
    xor eax, eax
    mov rcx, 4
PorDeslocamento3:
    mov eax, [var+rcx]
PorDeslocamento3P:
;----------------------
    xor eax, eax
    lea r8, [var]
    mov rcx, 4
PorDeslocamento4:
    mov eax, [r8+rcx]
PorDeslocamento4P:
;----------------------
    xor eax, eax
; Indexador é 1, 2, 4 ou 8 (x64)
PorDeslocamentoIndexado1:
    mov eax, [var + 1 * 4]
PorDeslocamentoIndexado1P:
;----------------------
    xor eax, eax
    mov rcx, 1
PorDeslocamentoIndexado2:
    mov eax, [var + rcx * 4]
PorDeslocamentoIndexado2P:
;----------------------
    xor eax, eax
    lea r8, [var]
PorDeslocamentoIndexado3:
    mov eax, [r8 + rcx * 4]
PorDeslocamentoIndexado4: 

;----------------------
    xor eax, eax

fim:
    mov rax, 60
    mov rdi, 0
    syscall
