; Aula 08 - Modos de Endereçamento
; arquivo: a08at02.asm
; Atividade 02
;           inversão de entrada de caracteres
; nasm -f elf64 a08at02.asm ; ld a08at02.o -o a08at02.x

section .data
    txtE:  db "Entre com o vetor: "
    txtEl: equ $ - txtE

    txtS:  db " é inversão de "
    txtSl: equ $ - txtS

section .bss
    vetE: resb 11 ; 10 + enter
    vetS: resb 11 ; 10 + enter

section .text
   global _start

_start:
    ; Entrada =========================
    mov rax, 1
    mov rdi, 1
    mov rsi, txtE
    mov edx, txtEl
    syscall
    
    ; Efetiva Leitura
    mov rax, 0
    mov rdi, 1
    mov rsi, vetE
    mov edx, 11
    syscall

    ; inversão ========================
    ; r8d -> controle i (texto original) (inc)
    ; r9d -> controle j (texto invertido) (dec)

    ; estado inicial para laço
    ;; j = 9
    ;; FOR( i = 0;
    xor r8d, r8d ; primeiro índice é 0
    mov r9d, 9   ; último índice é 9
    ; início do laço
lacoInversao:
    ; critério de parada
    ;; i = 10;
    cmp r8d, 10
    je saida

    ; inverte pares
    ;; {
    ;;  aux = vetE[i]
    ;;  vetS[j] = aux
    mov al, [vetE+r8d]
    mov [vetS+r9d], al

    ; altera-se variáveis de controle
    ;; i++){
    ;; j--
    inc r8d
    dec r9d
    ; retorna
    ;; }    -> fim do bloco FOR
    jmp lacoInversao

    ; Saída ===========================
saida:
    ; texto invertido
    mov rax, 1
    mov rdi, 1
    mov rsi, vetS
    mov edx, 10
    syscall    

    ; Texto intermediario
    mov rax, 1
    mov rdi, 1
    mov rsi, txtS
    mov edx, txtSl
    syscall

    ; Texto original
    mov rax, 1
    mov rdi, 1
    mov rsi, vetE
    mov edx, 11 ; aproveita-se o enter
    syscall 


fim:
   mov rax, 60
   mov rdi, 0 
   syscall
