; Aula 12 - SSE
; a12e05.asm
; Aritmética Packed de SP e DP
; nasm -f elf64 a12e05.asm ; gcc -m64 -no-pie a12e05.o -o a12e05.x

%define _exit   60

section .data
    align 32, db 0
    vetSP1 : dd 13.3, 14.4, 15.5, 16.6
    vetSP2 : dd  3.3,  4.4,  5.5,  6.6
    vetSPZ : dd    0,    0,    0,    0 ; desalinhou 32b

    align 32, db 0
    vetDP1 : dq 13.3, 14.4, 15.5, 16.6
    vetDP2 : dq  3.3,  4.4,  5.5,  6.6

section .bss
    alignb 32
    vetRSPADD : resd 4
    vetRSPMUL : resd 4

    vetRDPSUB : resq 4
    vetRDPDIV : resq 4

section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; 4-Packed ADD / MUL SP ===============================
    MOVAPS xmm0, [vetSP1]
    ADDPS xmm0, [vetSP2] ; gdb-tip: p $xmm0.v4_float

    MOVAPS xmm1, [vetSP1]
    MULPS xmm1, [vetSP2] ; gdb-tip: p $xmm1.v4_float
    

    ; 4-Packed SUB / DIV DP ===============================
    VMOVAPS ymm2, [vetDP1]
    VSUBPD ymm2, [vetDP2] ; gdb-tip: p $ymm2.v4_double

    VMOVAPS ymm3, [vetDP1]
    VDIVPD ymm3, [vetDP2] ; gdb-tip: p $ymm3.v4_double

    ; future trick-shot!
    MOVAPS xmm5, [vetSP1]
hadd1:
    HADDPS xmm5, [vetSP2] ; gdb-tip: p $xmm5.v4_float
hadd2:
    HADDPS xmm5, [vetSPZ] ; gdb-tip: p $xmm5.v4_float
hadd3:
    HADDPS xmm5, [vetSPZ] ; gdb-tip: p $xmm5.v4_float

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall
