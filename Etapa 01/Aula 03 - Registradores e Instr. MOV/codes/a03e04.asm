; Aula 03 - Registradores e MOV
; arquivo: a03e04.asm
; objetivo: calculo de enderecamento MOV e LEA
; nasm -f elf64 a03e04.asm ; ld a03e04.o -o a03e04.x

section .data
    ; int vetorInt[10] = {42,1, 2, 3, 4, 5, 6, 7, 8, 9};
    vetorInt : dd 42, 1, 2, 3, 4, 96, 6, 7, 8, 9

section .text
    global _start

_start:
    ; ponteiro para o vetorInt
    ; *vetorInt
    ; cuidado: x86_64 contem endereços de 8 bytes
    lea r8, [vetorInt]

    ; primeiro elemento do vetorInt
    ; vetorInt[0]
    ; cuidado: inteiro em x86_64 contem 4 bytes
    mov eax, [vetorInt]

    ; como pegar o segundo elemento?
    ; vetorInt[1]
    ; deslocar o ponteiro vetorInt em 4 bytes, que eh o tamanho de um inteiro
    
    ; calculo de endereco de vetorInt[1] com LEA
    lea r9, [vetorInt + 4] ; adiciona-se 4 bytes ao end. vetorInt

    ; busca do segundo elemento com MOV
    mov ebx, [r9]   ; r9 aponta para vetorInt+4 -> vetorInt[1]
    
    ; eh possivel indexar esse LEA?
    ; sim!!!!!
    
    ; Regra: o calculo de endereco eh no formato [base + indexador * deslocamento]
    ; por exemplo, para recuperar o vetorInt[5], usa-se
    ; [base=vetorInt + indice=5 * tamanhoInteiro=4]
    lea r10, [vetorInt + 5 * 4]
    mov ecx, [r10]

    ; porem, eh possivel executar a busca diretamente com MOV
    mov edx, [vetorInt + 5 * 4]

    ; para futuras aulas: LEA não altera FLAGS!!!! 
    ; o que mantem a consistencia da instrução CMP utilizado nos saltos condicionais
    ; visto na Aula 07
fim:
    mov rax, 60
    mov rdi, 0
    syscall
