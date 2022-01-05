; Aula 08 - Modos de Endereçamento
; arquivo: a08at03.asm
; Atividade 03
;           ordenação de vetor de inteiros
; nasm -f elf64 a08at03.asm ; ld a08at03.o -o a08at03.x


section .data
    vetOriginal:  dd 20,60,90,40,50,30,70,80,90,10

section .bss
    vetOrdenado: resd 10

section .text
    global _start

_start:

    ; ordenação por selection sort

    xor eax, eax ; index da ordenação
    xor ebx, ebx ; index do menor atual
    xor ecx, ecx ; index percorrido
    xor edx, edx ; menor número para comparação

laco:
    ; critério de parada
    ; index da ordenação chegou ao fim (10)
    cmp eax, 10
    je fim

    ; estado inicial do laço interno
    mov ebx, eax ; menor valor é o primeiro elemento
    mov ecx, eax ; index percorrido é o segundo elemento
    inc ecx
    lacoSub1:
        ; criterio de parada
        ; index percorrido chegou ao fim (10)
        cmp ecx, 10
        je copiarMenorElemento

        ; copia do menor elemento para comparação
        mov edx, [vetOriginal+ebx*4]
        cmp edx, [vetOriginal+ecx*4]
        jge lacoSub1Continua

        ; jl efetua troca de indices
        mov ebx, ecx
        ; incrementa index de controle ecx
        inc ecx
        ; retorna lacoSub1
        jmp lacoSub1

    lacoSub1Continua:
        

    copiarMenorElemento:
        ; eax contém índice destino
        ; edx menor valor
        mov [vetOrdenado+eax*4], edx
        
        ; index ordenacao++
        inc eax
        jmp laco
    

fim:
   mov rax, 60
   mov rdi, 0 
   syscall
