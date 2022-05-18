; Aula 11 - Ponto-Flutuante
; a11e01.asm
; Conversão de Inteiro para FP 
; Conversão de FP para Inteiro
; nasm -f elf64 a11e01.asm ; gcc -m64 -no-pie a11e01.o -o a11e01.x

%define _exit   60
extern printf
extern scanf

section .data
    pfstr1 : db "Digite um Inteiro: ", 0
    pfstr2 : db "Inteiro %d convertido para float = %f",10, 0
    pfstr3 : db "Inteiro %d convertido para double = %f",10, 0
    pfstr4 : db "pi? = %f, int(pi) = %d", 10, 0
    
    sfstr1 : db "%d",0

    fppi : dq 3.1415    ; double

section .bss
    inteiro1 : resd 1
    float1   : resd 1

section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; eax = printf("Digite um Inteiro: ");
    xor rax, rax
    mov rdi, pfstr1 ; string de controle para printf
    call printf 

    ; eax = scanf("%d", &inteiro1);
    xor rax, rax
    mov rdi, sfstr1
    mov rsi, inteiro1
    call scanf

    ; Conversão de Inteiro para FP
    ; xmm0 = (float) inteiro1
    CVTSI2SS xmm0, dword [inteiro1] ; int 2 float
l1:
    ; eax = printf("Inteiro %d convertido para float = %f\n", inteiro1, xmm0);
    mov rax, 1 ; existe um FP a ser impresso e já está em xmm0
    mov rdi, pfstr2
    mov esi, [inteiro1]
    ; notas sobre printf e FP
    ;       printf destroi xmmi após chamada, opcional: salvar float/double
    MOVSS [float1], xmm0 ; salva FP em float1
    ;       considera %f como double, necessário converter SS para SD
    CVTSS2SD xmm0, xmm0 ; float 2 double 4 printf
l11:
    call printf

 
l2:
    ; eax = printf("Inteiro %d convertido para double = %f\n", inteiro1, xmm0);
    mov rax, 1 ; existe um FP a ser impresso
    mov rdi, pfstr3
    mov esi, [inteiro1]
    CVTSS2SD xmm0, [float1] ; float 2 double 4 printf
l21:
    call printf


l3:
    ; eax = printf("pi? = %f, int(pi) = $d", fppi, int(fppi));
    ; eax = printf("pi? = %f, int(pi) = $d", xmm0, esi);
    mov rax, 1 ; existe um FP a ser impresso
    mov rdi, pfstr4
    MOVSD xmm0, [fppi]
    CVTSD2SI esi, qword [fppi]
l31:
    call printf


fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall

