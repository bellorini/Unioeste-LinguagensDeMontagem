; Aula 11 - Ponto-Flutuante
; a11e04.asm
; Identifica maior float entre dois entrados pelo usuário
; nasm -f elf64 a11e04.asm ; gcc -m64 -no-pie a11e04.o -o a11e04.x

%define _exit   60
extern printf
extern scanf

section .data
    pfstr1 : db "Entre dois floats (x.xx y.yy): ", 0
    scstr1 : db "%f %f", 0
    pfstr2 : db "Maior float é: %f", 10, 0

    pfstrMaior  : db "%f é maior do que %f", 10 ,0
    pfstrMenor  : db "%f é menor do que %f", 10 ,0
    pfstrIguais : db "%f é igual a %f", 10 ,0

    pfstrERRO   : db "ERRO", 10, 0

section .bss
    scfF1 : resd 1 ; float 1
    scfF2 : resd 1 ; float 1

section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; eax = printf("Entre dois floats (x.xx y.yy): ", 1);
    xor rax, rax
    mov rdi, pfstr1 ; string de controle para printf
    mov esi, 1
    call printf

    ; eax = scanf("%f %f", &scfF1, &scfF2);
    xor rax, rax
    mov rdi, scstr1
    lea rsi, [scfF1] ; float1 ; Load Efective Address!!!
    lea rdx, [scfF2] ; float2
    call scanf
  
    movss xmm0, [scfF1]
    movss xmm1, [scfF2]

    lif1:
    COMISS xmm0, xmm1
    JP lerro    ; para teste, trocar para NJP
    JE liguais  ; xmm1 == xmm0?
    JA lmaior   ; xmm1 < xmm0?
    JB lmenor   ; xmm1 > xmm0?

    liguais:
        lea rdi, [pfstrIguais]
        jmp lfi1
    lmenor:
        lea rdi, [pfstrMenor] 
        jmp lfi1
    lmaior:
        lea rdi, [pfstrMaior] 
        jmp lfi1
    lerro:
        lea rdi, [pfstrERRO]

    lfi1:
        mov rax, 2
        cvtss2sd xmm0, [scfF1]
        cvtss2sd xmm1, [scfF2]
        call printf

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall

