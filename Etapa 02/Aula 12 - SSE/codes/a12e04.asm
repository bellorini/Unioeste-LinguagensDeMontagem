; Aula 12 - SSE
; a12e04.asm
; Aritmética Packed de Inteiros
; nasm -f elf64 a12e04.asm ; gcc -m64 -no-pie a13e04.o -o a12e04.x

%define _exit   60

section .data
    align 32, db 0
    vetInt1 : dd 10, 20, 30, 40, 50, 60, 70, 80
    vetInt2 : dd  2,  2,  2,  2,  5,  2,  2,  2 

    vetHInt1 : dw 10, 20, 30, 40, 50, 60, 70, 80

section .bss
    alignb 32
    vetIntADD432 : resd 4
    vetIntSUB432 : resd 4
    
    vetHIntADD816 : resw 8

    vetIntMUL232 : resd 4

section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; 4-Packed ADD / SUB ==================================
    MOVDQA xmm1, [vetInt1]
    MOVDQA xmm2, [vetInt2]

    ; vetIntADD432 = vetInt1 + vetInt2
    PADDD xmm1, xmm2
    MOVDQA [vetIntADD432], xmm1 ; gdb-tip: x /4d &vetIntADD432

    ; vetIntSUB432 = vetInt1 - vetInt2
    MOVDQA xmm1, [vetInt1]
    PSUBD xmm1, xmm2
    MOVDQA [vetIntSUB432], xmm1 ; gdb-tip: x /4d &vetIntSUB432

    ; 8-Packed ADD ========================================
    MOVDQA xmm6, [vetHInt1]
    MOVDQA xmm7, [vetHInt1]

    ; vetHIntADD816 = vetHInt1 + vetHInt1
    PADDW xmm6, xmm7

    MOVDQA [vetHIntADD816], xmm6 ; gdb-tip: x /8dh &vetHIntADD816

    ; 4-packed MUL ?========================================
    MOVDQA xmm4, [vetInt1]
    MOVDQA xmm5, [vetInt2]  
    
    PMULDQ xmm4, xmm5   ; gdp-tip: p $xmm4.v4_int32

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall
