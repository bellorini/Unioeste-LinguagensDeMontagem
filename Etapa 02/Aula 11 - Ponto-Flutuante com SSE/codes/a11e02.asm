; Aula 11 - Ponto-Flutuante
; a11e02.asm
; Calculo de distância entre pontos 3D
; d = raiz( (x1 - x2)^2 + (y1 - y2)^2 + (z1 - z2)^2)
; nasm -f elf64 a11e02.asm ; gcc -m64 -no-pie a11e02.o -o a11e02.x

%define _exit   60
extern printf
extern scanf

section .data
    pfstr1 : db "Entre com Ponto_%d (int) no formato x y z: ", 0
    scstr1 : db "%d %d %d", 0
    pfstr2 : db "Distância é = %f",10,0

section .bss
    scfP1 : resd 3 ; x1,y1,z1
    scfP2 : resd 3 ; x2,y2,z2

section .text
    global main

main:
    ; stack-frame
    push rbp
    mov rbp, rsp

    ; eax = printf("Entre com Ponto_%d (int) no formato x y z: ", 1);
    xor rax, rax
    mov rdi, pfstr1 ; string de controle para printf
    mov esi, 1
    call printf

    ; eax = scanf("%d %d %d", &(scfP1), &(scfP1+4), &(scfP1+8))
    xor rax, rax
    mov rdi, scstr1
    lea rsi, [scfP1]   ; x1 ; Load Efective Address!!!
    lea rdx, [scfP1+4] ; y1
    lea rcx, [scfP1+8] ; y1
    call scanf
  
    ; eax = printf("Entre com Ponto_%d (int) no formato x y z: ", 2);
    xor rax, rax
    mov rdi, pfstr1 ; string de controle para printf
    mov esi, 2
    call printf

    ; eax = scanf("%d %d %d", &(scfP2), &(scfP2+4), &(scfP2+8))
    xor rax, rax
    mov rdi, scstr1    ; mesma entrada
    lea rsi, [scfP2]   ; x2 ; Load Efective Address!!!
    lea rdx, [scfP2+4] ; y2
    lea rcx, [scfP2+8] ; y2
    call scanf

    ; conversão para double já em registradores
    ; xmm0-2 -> x1, y1, z1
    ; xmm3-5 -> x2, y2, z2
    cvtsi2sd xmm0, dword [scfP1]    ; x1
    cvtsi2sd xmm1, dword [scfP1+4]  ; y1
    cvtsi2sd xmm2, dword [scfP1+8]  ; z1
    cvtsi2sd xmm3, dword [scfP2]    ; x2
    cvtsi2sd xmm4, dword [scfP2+4]  ; y2
    cvtsi2sd xmm5, dword [scfP2+8]  ; z2

    ; xmm0 = (x1 - x2)^2  
    subsd xmm0, xmm3    ; (x1 - x2)
    mulsd xmm0, xmm0    ; ^2

    ; xmm1 = (y1 - y2)^2  
    subsd xmm1, xmm4    ; (y1 - y2)
    mulsd xmm1, xmm1    ; ^2
    
    ; xmm2 = (z1 - z2)^2  
    subsd xmm2, xmm5    ; (z1 - z2)
    mulsd xmm2, xmm2    ; ^2

    ; adição das 3 diferenças ao quadrado
    addsd xmm0, xmm1    
    addsd xmm0, xmm2

    ; raiz quadrada em xmm0
    sqrtsd xmm0, xmm0

    ; print para resposta
    ; eax = printf("Distância é = %f\n", xmm0);
    mov rax, 1      ; 1 double a ser impresso
    mov rdi, pfstr2 ; string de controle para printf
    call printf

fim:
    ; "destack-frame!"
    mov rsp, rbp
    pop rbp

    mov rax, _exit
    mov rdi, 0
    syscall

