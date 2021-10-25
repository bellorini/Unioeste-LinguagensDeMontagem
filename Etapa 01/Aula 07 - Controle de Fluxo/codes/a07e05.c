/*
 Aula 07 - Controle de Fluxo de Execucao
 arquivo: a07e05.c
 objetivo: multiplicacao por somas sucessivas
           para relacionar lacos de repeticao com assembly
           anexo do arquivo a07e05.asm
 gcc a07e05.c -o a07e05c.x
*/
#include <stdio.h>

int main(){

    int multiplicando = 5;
    int multiplicador = 13;
    int resultado = 0;

    for(int i = multiplicador; i>0; i--){
        resultado += multiplicando;
    }

    printf("%d * %d = %d\n", multiplicando, multiplicador, resultado);

    return 0;
}
