; chamada para printf
;  x86
 
; montar e ligar:
;   nasm -f elf32 a11e04.asm ; gcc -m32 a11e04.o -o a11e04.x

%define _exit   1
%define _kernel 0x80

section .data
    strCtrl : db 'I can kill you %s, %d times!', 10, 0 ; null-terminated
    umInt   : dd 2
    umaStr  : db 'with my brain', 0 ; null-terminated

extern printf   ; indicação de chamada de função externa C

section .text
    global main ; para deixar o gcc/ld feliz!

main:
    ; não será salvo registradores

    ; printf("I can kill you %s, %d times!\n", umaStr, umInt)
    ; empilha parâmetros da direita para esquerda
    push dword [umInt] ; conteúdo do inteiro 'umInt'
    push umaStr ; endereço para string 'umaStr'
    push strCtrl ; string de controle para printf
    call printf

fim:
    mov eax, _exit
    mov ebx, 0
    int _kernel
