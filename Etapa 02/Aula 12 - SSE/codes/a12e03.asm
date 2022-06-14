; Aula 12 - SSE
; a12e03.asm
; Conversão de Packed-Integer para FP 
; Conversão de FP para Packed-Integer
; nasm -f elf64 a12e03.asm ; gcc -m64 -no-pie a12e03.o -o a12e03.x

%define _exit   60

section .data
    vetInt1 : dd 10, 20, 30, 40, 50, 60, 70, 80

section .bss
    alignb 32
    vetInt2SP2DP : resq 4

    alignb 32
    vetSP2Int : resd 4
    alignb 32
    vetDP2Int : resd 4

section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; Conversão Int 2 FP ===============================
    ; PACKED-INTEGERS para PACKED-FPs ==================

    ; converter 2 inteiros 32 bits cada para 2 FP single
    CVTPI2PS xmm1, [vetInt1] ; gdb_tip: p $xmm1.v4_float

    ; converter 4 inteiros 32 bits cada para 4 FP single
    VCVTDQ2PS xmm2, [vetInt1]

    ; converter 8 inteiros 32 bits cada para 8 FP single
    VCVTDQ2PS ymm3, [vetInt1] ; gdb_tip: p $ymm3.v8_float

    ; converter 2 inteiros 32 bits cada para 2 FP double
    CVTPI2PD xmm4, [vetInt1] ; gdb_tip: p $xmm4.v2_double

    ; converter 4 inteiros 32 bits cada para 4 FP double
    VCVTDQ2PD ymm5, [vetInt1] ; gdb_tip: p $ymm5.v4_double


    ; Converter Int to SP to DP =========================
    ; passo 1 -> converter 4 inteiros para SP
    VCVTDQ2PS xmm6, [vetInt1] ; gdb_tip: p $xmm6.v4_float
    ; passo 2 -> converter 4 floats para double
    VCVTPS2PD ymm7, xmm6 ; gdb_tip: p $ymm7.v4_double
    ; pass3 -> armazenar em [vetInt2SP2DP]
    VMOVDQA [vetInt2SP2DP], ymm7 ; gdb_tip: x /4gf &vetInt2SP2DP


    ; Converter DP e SP to Int ==========================
    ; converter 4 float 32 bits para 4 inteiros 32 bits
    CVTPS2DQ xmm8, xmm2 ; gdb_tip: p $xmm8.v4_int32
    MOVDQA [vetSP2Int], xmm8 ; gdb_tip: x /4wd &vetSP2Int
    
    ; converter 2 double 64 bits para 2 inteiros 32 bits
    CVTPD2DQ xmm9, xmm7 ; gdb_tip: p $xmm9.v4_int32
    ; converter 4 double 64 bits para 4 inteiros 32 bits
    VCVTPD2DQ xmm10, ymm7 ; gdb_tip: p $xmm10.v4_int32
    MOVDQA [vetDP2Int], xmm10 ; gdb_tip: x /4wd &vetDP2Int

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall
