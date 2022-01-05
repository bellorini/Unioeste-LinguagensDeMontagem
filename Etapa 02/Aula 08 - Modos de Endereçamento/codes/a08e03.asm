; Aula 08 - Demonstração dos modos de endereçamento
; arquivo: a08e03.asm
; objetivo: percorrer vetores de char e inteiros
; nasm -f elf64 a08e03.asm ; ld a08e03.o -o a08e03.x

section .data
    v1 : db 'a', 'b', 'c', 'd', 'e'        ; vetor de char (char v1[5];)
    v2 : dd 1024, 2048, 4096,  8192, 16384 ; vetor de int  (int  v2[5];)

section .text
    global _start

_start:
    ; exemplos
    mov eax, 0    ; end. imediato
    mov r15d, eax ; end. por registrador
    ; r15d é contador de posição

    mov r8, v1   ; r8 = &v1 (r8 é ponteiro para v1)
    mov r9, v2   ; r9 = &v2 (r9 é ponteiro para v2)

laco:
    mov al , [r8]         ; end. indireto por registrador
              
    mov bl , [v1+r15d]    ; end. por deslocamento
                          ; offset + deslocamento (reg)
                          ; v1 = 0x60011c

    ;mov ecx, [r9+r15d*4] ; end. é inválido 
                          ; misturar 32b com 64b?

    mov edx, [v2+r15d*4]  ; end. por deslocamento indexado
                          ; offset + deslocamento * posicionamento
jmpLaco:
    inc r8                ; para indexação incremental
    inc r9                ; para indexação incremental
    inc r15d
    cmp r15d, 5
    jl laco

    mov r10b, [v1]    ; 'a' end. direto
    mov r11b, [v1+2]  ; 'c' end. direto por deslc.

    mov r12d, [v2]    ; 1024 end. direto
    mov r13d, [v2+8]  ; 4096 end. direto com deslc.

fim:
    mov rax, 60  ; end. imediato
    mov rdi, 0   ; end. imediato
    syscall
