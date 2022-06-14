; Aula 12 - SSE
; a12e02.asm
; Transferência de FPs entre MEM e Y|XMMi
; nasm -f elf64 a12e02.asm ; gcc -m64 -no-pie a12e02.o -o a12e02.x

%define _exit   60

section .data
    align 32, db 0 ; alinhar memória ou SIGSEGV durante MOVDQA!
    vetFloat1  : dd 10.1, 20.2, 30.3, 40.4, 50.5, 60.6, 70.7, 80.8
    vetDouble1 : dq 15.1, 25.2, 35.3, 45.4, 55.5, 65.6, 75.7, 85.8

section .bss
    alignb 32 
    vetRFloat2 : resd 2
    alignb 32
    vetRFloat4 : resd 4
    alignb 32
    vetRFloat8 : resd 8
    alignb 32
    vetRDouble2 : resq 2
    alignb 32
    vetRDouble4 : resq 4


section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; ============= FLOAT ================================
    ; Transferência FLOAT mem -> xmm =====================
    ; 2*32bits -> 64bits
    MOVLPS xmm1, [vetFloat1] ; gdb_tip: p $xmm1.v4_float

    ; 4*32bits -> 128bits
    MOVAPS xmm2, [vetFloat1] ; gdb_tip: p $xmm2.v4_float

    ; 8*32bits -> 256bits
    VMOVAPS ymm3, [vetFloat1] ; gdb_tip: p $ymm3.v8_float

    ; Transferência FLOAT xmm -> mem =====================
    ; 2*32bits -> 64bits
    MOVLPS [vetRFloat2], xmm1 ; gdb_tip: x /2f &vetRFloat2

    ; 4*32bits -> 128bits
    MOVAPS [vetRFloat4], xmm2  ; gdb_tip: x /4f &vetRFloat4
    ; pode ser usado MOVUPS, porém é mais lento! Só não esquecer do align[b]

    ; 8*32bits -> 256bits
    VMOVAPS [vetRFloat8], ymm3 ; gdb_tip: x /8f &vetRFloat8
    ; pode ser usado VMOVUPS, porém é mais lento! Só não esquecer do align[b]

    ; ============= DOUBLE ================================
    ; Transferência DOUBLE mem -> xmm =====================
    ; 2*64bits -> 128bits
    MOVAPD xmm8, [vetDouble1] ; gdb_tip: p $xmm8.v2_double

    ; 4*64bits -> 256bits
    VMOVAPD ymm9, [vetDouble1] ; gdb_tip: p $ymm9.v4_double

    ; Transferência DOUBLE xmm -> mem =====================
    ; 2*64bits -> 128bits
    MOVAPD [vetRDouble2], xmm8 ; gdb_tip: x /2fg &vetRDouble2

    ; 4*64bits -> 256bits
    VMOVAPD [vetRDouble4], ymm9 ; gdb_tip: x /4fg &vetRDouble4

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall
