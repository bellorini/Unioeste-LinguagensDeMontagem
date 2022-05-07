; exemplo de  
;    uso de arquivos para organizar subprogramas
; Função int strLengh(str s) 

strLength:
    ; passo 1 - Antes do corpo do sub-programa
    ; criar stack-frame
    push rbp
    mov rbp, rsp

    ; passo 2 - Antes do corpo do sub-programa
    ; criar espaço para variáveis locais
    sub rsp, 4  ; 4 bytes para uma variável inteira local
    ; [rsp-4] é o deslocador até encontrar '0'

    ; passo 3 - Antes do corpo do sub-programa
    ; salvar registradores RBX, RDI, RSI, R12 - R15
    push rbx
    push rdi
    push rsi
    push r12
    push r13
    push r14
    push r15

    ; sub-programa - inicio -----------------------------
    ; RDI = char *c[] - parâmetro 1
    mov dword [rbp-4], 0
    laco:
        mov edx, [rbp-4]  ; deslocador de 32 bits
        mov al, [rdi+rdx] ; char[deslocador]
        cmp al, 0         ; char é zero?
        je finaliza
        inc edx           ; desloc++
        mov [rbp-4], edx  ; guarda deslocador
        jmp laco

    finaliza:   
    ; sub-programa - fim --------------------------------
   
    ; passo 4 - depois do corpo do sub-programa
    ; copiar resultado para EAX
    mov eax, [rbp-4]
    ; adiciona 1 para contar /0
    inc eax

    ; passo 5 - depois do corpo do sub-programa
    ; recuperar registradores RBX, RDI, RSI, R12 - R15
    pop r15 ; último empilhado
    pop r14
    pop r13
    pop r12
    pop rsi 
    pop rdi
    pop rbx ; primeiro empilhado

    ; passo 6 - depois do corpo do sub-programa
    ; desalocar variáveis locais
    mov rsp, rbp

    ; passo 7 - depois do corpo do sub-programa
    ; recuperar ebp antigo e garantir endereço de retorno
    pop rbp

    ; passo 8 - depois do corpo do sub-programa
    ; sempre, sempre, sempre retorne com RET
    ret
   
