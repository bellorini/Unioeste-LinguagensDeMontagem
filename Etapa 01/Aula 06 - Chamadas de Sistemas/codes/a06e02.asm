; Aula 06 - Chamada de Sistemas
; arquivo: a06e01.asm
; objetivo: leitura do arquivo a06e02.txt
;           impressão no terminal de arquivo de texto
;           cria arquivo caso inexistente
; nasm -f elf64 a06e02.asm ; ld a06e02.o -o a06e02.x

%define maxChars 20 ; no. máximo de caracteres a serem lidos

; valores em octal
%define readOnly  0o ; flag open()
%define writeOnly 1o ; flag open()
%define readwrite 2o ; flag open()
%define openrw  102o ; flag open()
%define userWR 644o  ; Read+Write+Execute
%define append 2101o ; flag open() criar/escrever no final

section .data
    fileName: db "a06e02.txt", 0 ; null-terminated string!

section .bss
    texto: resb 25
    fileHandle: resd 1

section .text
    global _start

_start:
    ; int open(const char *pathname, int flags, mode_t mode);
    mov rax, 2          ; open file
    lea rdi, [fileName] ; *pathname
    mov esi, openrw     ; flags
    mov edx, userWR     ; mode
    syscall

    mov [fileHandle], eax
leitura:
    ; ssize_t read(int fd, void *buf, size_t count); 
    mov rax, 0            ; leitura do arquivo
    mov edi, [fileHandle] ; fd
    lea rsi, [texto]      ; *buf
    mov edx, maxChars     ; count
    syscall

escrita:
    mov rax, 1   ; escrita em terminal
    mov rdi, 1
    lea rsi, [texto]
    mov edx, maxChars
    syscall

fecha:
    mov rax, 3  ; fechar arquivo
    mov edi, [fileHandle]
    syscall

fim:
    mov rax, 60
    mov rdi, 0
    syscall
