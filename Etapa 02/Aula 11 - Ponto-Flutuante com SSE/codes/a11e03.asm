; Aula 11 - Ponto-Flutuante
; a11e03.asm
; Função absf(float)
; nasm -f elf64 a11e03.asm ; gcc -m64 -no-pie a11e03.o -o a11e03.x

%define _exit 60
extern printf
extern scanf

section .data
    pfstr1 : db "Entre com float [-]x: ", 0
    scstr1 : db "%f", 0
    pfstr2 : db "absf(%f) = %f", 10, 0

section .bss
    scfF1 : resd 1 ; thats a float!

section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; eax = printf("Entre com float [-]x: ");
    xor rax, rax
    mov rdi, pfstr1 ; string de controle para printf
    call printf

    ; eax = scanf("%f", &scfF1);
    xor rax, rax
    mov rdi, scstr1
    lea rsi, [scfF1] ; Load Efective Address!!!
    call scanf
l1:    
    ; xmm0 = abs(scfF1)
    ; p1 - save regs - não necesário
    ; p2 - 1 parâmetro float em xmm0
    movss xmm0, [scfF1]
    ; p3 - callllllll
    call absf   
    ; retorno em xmm0

    ; p4 - remover parâmetros da pilha - não necessário
    ; p5 - recuperar regs - não necessário
l2:
    ; eax = printf("abs(%f) = %f", scfF1, absf(scfF1));
    mov rax, 2
    lea rdi, [pfstr2]
    ; retorno de absf(scfF1) está em xmm0
        ; necessário trocar para xmm1
        ; recuperar FP original em xmm0
    cvtss2sd xmm1, xmm0
    cvtss2sd xmm0, [scfF1]
    call printf

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall

; xmm0 = abs(scfF1)
absf:
    ; p1 - stack-frame
    push rbp
    mov rbp, rsp
    ; p2 - vars locais
    ; p3 - save regs - não necessário

    ; absf? 
        ; xmm2 = (float) 0
        ; xmm1 = xmm2 - xmm0
        ; max(xmm0, (0-xmm1))
    XORPS  xmm2, xmm2       ; xmm2 = (float) 0
    VSUBSS xmm1, xmm2, xmm0 ; xmm1 = xmm2 - xmm0
    MAXSS xmm0, xmm1        ; max(xmm0, (0-xmm1))

    ; p4 - resultado em xmm0 :)

    ; p5 - recuperar regs - não necessário
    ; p6 - desalocar vars locais
    mov rsp, rbp
    ; p7 - destack-frame
    pop rbp
    ; p8 aways be ret!
    ret    
    
