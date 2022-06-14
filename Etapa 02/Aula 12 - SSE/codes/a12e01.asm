; Aula 12 - SSE
; a12e01.asm
; Transferência de Inteiros entre MEM e Y|XMMi
; nasm -f elf64 a12e01.asm ; gcc -m64 -no-pie a12e01.o -o a12e01.x

%define _exit 60

section .data
    align 32, db 0 ; alinhar memória ou SIGSEGV durante MOVDQA!
    vetInt1 : dd 10, 20, 30, 40, 50, 60, 70, 80

section .bss
    vetIntR1 : resd 2
    vetIntR2 : resd 2
    alignb 16
    vetIntR3 : resd 4 ; alinhado em 16
    vetIntR4 : resd 4 ; pode ser desalinhado
    alignb 32
    vetIntR5 : resd 8 ; alinhado em 32
    vetIntR6 : resd 8

section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; Transferência INT mem -> xmm =====================

    ; 32bits
    MOVD xmm1, [vetInt1] ; gdb_tip: p $xmm1.v4_int32

    ; 2*32bits -> 64bits
    MOVQ xmm2, [vetInt1] ; gdb_tip: p $xmm2.v4_int32

    ; 4*32bits -> 128bits alinhado em 16
    ; -> caso contrário, SIGSEGV!
    MOVDQA xmm3, [vetInt1] ; gdb_tip: p $xmm3.v4_int32

    ; 4*32bits -> 128bits desalinhado -> não precisa de align 16
    MOVDQU xmm4, [vetInt1] ; gdb_tip: p $xmm4.v4_int32

    ; 8*32bits -> 256bits alinhado em 32
    VMOVDQA ymm5, [vetInt1] ; gdb_tip: p $ymm5.v8_int32

    ; 8*32bits -> 256bits desalinhado
    VMOVDQU ymm6, [vetInt1] ; gdb_tip: p $ymm6.v8_int32

    ; Transferência xmm -> INT mem =====================
    ; 32bits
    MOVD [vetIntR1], xmm1 ; gdb_tip: x /2d &vetIntR1

    ; 2*32bits -> 64bits 
    MOVQ [vetIntR2], xmm2 ; gdb_tip: x /2d &vetIntR2

    ; 4*32bits -> 128bits alinhado em 16    
    MOVDQA [vetIntR3], xmm3 ; gdb_tip: x /4d &vetIntR3

    ; 4*32bits -> 128bits desalinhado -> não precisa de alignb 16
    MOVDQU [vetIntR4], xmm4  ; gdb_tip: x /4d &vetIntR4

    ; 8*32bits -> 256bits alinhado em 32
    VMOVDQA [vetIntR5], ymm5 ; gdb_tip: x /8d &vetIntR6

    ; 8*32bits -> 256bits desalinhado
    VMOVDQU [vetIntR6], ymm6 ; gdb_tip: x /8d &vetIntR6

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall
