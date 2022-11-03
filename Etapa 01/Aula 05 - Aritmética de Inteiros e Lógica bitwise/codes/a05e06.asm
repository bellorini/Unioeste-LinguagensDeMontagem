; Aula 05 - Aritmética e Lógica
; arquivo: a05e06.asm
; objetivo: Deslocamento Lógico SHR e SHL
; nasm -f elf64 a05e06.asm ; ld a05e06.o -o a05e06.x

section .data
    multiplicando1 : dq  50 
    multiplicando2 : dq -50
    multiplicador1 : dq   3

    dividendo1     : dq  100
    dividendo2     : dq -100
    divisor1       : dq  25

section .text
    global _start

_start:
multiplicacao0:
    ; EAX <- multiplicando1 = 50
    ; EDX:EAX <- EAX * multiplicador
    mov eax, [multiplicando1]
    mul dword [multiplicador1] ; pode ser memória

multiplicacao1:
    ; EAX <- multiplicando2 = -50
    ; EDX:EAX <- EAX * multiplicador
    mov  eax, [multiplicando2]
    mov  ebx, [multiplicador1]
    imul ebx ; também pode ser registrador

divisao0:
    ; EAX <- dividendo1 = 100
    ; EDX:EAX <- EDX:EAX / divisor
    xor edx, edx ; bytes altos
    mov eax, [dividendo1] ; bytes baixos
    div dword [divisor1]  ; pode ser memória

divisao1:
      ; EAX <- dividendo1 = -100
      ; EDX:EAX <- EDX:EAX / divisor
    mov  edx, -1 ; bytes altos
    mov  eax, [dividendo2] ; bytes baixos
    mov  ebx, [divisor1]   
    idiv ebx               ; também pode ser registrador

fim:
    mov rax, 60
    mov rdi, 0
    syscall 
   
