; code 64 bits
; montar: nasm -f elf64 a09e02.asm
; ligar : ld a09e02.o -o a09e02.x
; one line to rule them all: 
;    nasm -f elf64 a09e02.asm; ld a09e02.o -o a09e02.x

section .data
    v1 : db 'a'
    v2 : dw '2b'
    v3 : dd '4ccc'
    v4 : dq '8ddddddd'

section .text
    global _start

_start:

;   push byte  [v1] ;  8 bits -> não permitido em x64
    push word  [v2]
;   push dword [v3] ; 32 bits -> não permitido em x64
    push qword [v4]


fim:
    mov rax, 60
    mov rdi, 0
    syscall
