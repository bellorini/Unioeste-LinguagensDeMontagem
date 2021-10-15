; Aula 02 - Estrutura dos Programas
; arquivo: a02e01.asm
; objetivo: dados inicializados
; nasm -f elf64 a02e01.asm ; ld a02e01.o -o a02e01.x

section .data
    v1: db    0x55              ; byte 0x55 
    v2: db    0x55,0x56,0x57    ; 3 bytes em sucessao 
    v3: db    'a',0x55          ; caracteres sao aceitos com aspas 
    v4: db    'hello',13,10,'$' ; strings tambem 
    v5: dw    0x1234            ; 0x34 0x12 
    v6: dw    'a'               ; 0x61 0x00 
    v7: dw    'ab'              ; 0x61 0x62
    v8: dw    'abc'             ; 0x61 0x62 0x63 0x00 (string) 
    v9: dd    0x12345678        ; 0x78 0x56 0x34 0x12

section .text
    global _start

_start:
    ; não executa acoes, por enquanto!
fim:
    mov rax, 60
    mov rdi, 0
    syscall
