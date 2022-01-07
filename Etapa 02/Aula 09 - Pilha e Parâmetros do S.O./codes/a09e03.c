#include <stdio.h>

int main(int argc, char *argv[]){

   int k = 1;

   printf("\nNome do programa: %s\n", argv[0]);
   argc --;

   while(argc > 0){
      printf("param           : %s\n", argv[k]);
      k++;
      argc--;
   }
   
   printf("\n");

   return 0;
}
