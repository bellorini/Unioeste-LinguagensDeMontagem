; exemplo de 
;    chamada de sub-programas em x86

; sub-programa para encontrar o tamanho de string null-terminated
; cabeçalho em C: int strLength(char *c[]);

; montar e linkar com: 
;  nasm -f elf32 a11e02.asm ; ld a11e02.o -m elf_i386 -o a11e02.x

; arquitetura 32 bits = int 0x80
%define _write  4
%define _exit   1
%define _kernel 0x80

section .data
    strTeste1 : db 'string null-terminated', 0       ; 22 + 1
    strTeste2 : db 'outra string null-terminated', 0 ; 28 + 1
    strTeste3 : db 'Yes Captain', 0                  ; 11 + 1

section .bss
    str1L : resd 1
    str2L : resd 1
    str3L : resd 1

section .text
    global _start

_start:
    ; valores para teste de salvamento de registradores
    mov eax, 1
    mov ebx, 2
    mov ecx, 3
    mov edx, 4
    mov edi, 5
    mov esi, 6

    ; passo 1 - Antes da chamada CALL
    ; salvar registradores EAX, ECX e EDX
    push eax
    push ecx
    push edx

    ; passo 2 - Antes da chamada CALL
    ; empilhar parâmetros da direita para esquerda
    push strTeste1

    ; passo 3 - chamada CALL
    call strLength

    ; retorno do sub-programa em EAX
    mov [str1L], eax

    ; passo 4
    ; remover parâmetros da PILHA
    add esp, 4 ; +4 para cada parâmetro empilhado

    ; passo 5
    ; recuperar registradores EAX, ECX e EDX
    pop edx  ; último empilhado
    pop ecx
    pop eax  ; primeiro empilhado


fim:
    mov eax, _exit
    mov ebx, 0
    int _kernel


strLength:
    ; passo 1 - Antes do corpo do sub-programa
    ; criar stack-frame
    push ebp
    mov ebp, esp

    ; passo 2 - Antes do corpo do sub-programa
    ; criar espaço para variáveis locais
    sub esp, 4  ; 4 bytes para uma variável inteira local
    ; [esp-4] é o deslocador até encontrar '0'

    ; passo 3 - Antes do corpo do sub-programa
    ; salvar registradores EBX, EDI e ESI
    push ebx
    push edi
    push esi

    ; sub-programa - inicio -----------------------------
    mov ecx, [ebp+8] ; char *c[] - parâmetro 1
    mov dword [ebp-4], 0 ; deslocador
    laco:
        mov edx, [ebp-4]  ; deslocador
        mov al, [ecx+edx] ; char[deslocador]
        cmp al, 0            ; char é zero?
        je finaliza
        inc edx              ; desloc++
        mov [ebp-4], edx  ; guarda deslocador
        jmp laco

    finaliza:    
    ; sub-programa - fim --------------------------------
    
    ; passo 4 - depois do corpo do sub-programa
    ; copiar resultado para EAX
    mov eax, [ebp-4]
    ; adiciona 1 para contar /0
    inc eax

    ; passo 5 - depois do corpo do sub-programa
    ; recuperar registradores EBX, EDI e ESI
    pop esi ; último empilhado
    pop edi
    pop ebx ; primeiro empilhado

    ; passo 6 - depois do corpo do sub-programa
    ; desalocar variáveis locais
    mov esp, ebp

    ; passo 7 - depois do corpo do sub-programa
    ; recuperar ebp antigo e garantir endereço de retorno
    pop ebp

    ; passo 8 - depois do corpo do sub-programa
    ; sempre, sempre, sempre retorne com RET
    ret
    
