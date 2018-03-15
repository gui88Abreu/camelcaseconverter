
#include "ccc_lib.h"
#include <ctype.h> /*Transformar maiusculas em minusculas*/
#include <string.h> /*Encontrar o tamanho da string*/

void camelcase_to_underline(char *input, char *output) {
  int j = 1;
  int tam_n, tam = strlen(input);
  char underLined[tam*2];
  tam_n = 2*tam;
  underLined[0] = tolower(input[0]);

  for(int i = 1; i < tam; i++){
    if(input[i] >= 65 && input[i] <= 90){
      underLined[j++] = '_';
      underLined[j++] = tolower(input[i]);
    }
    else{
      underLined[j] = input[i];
      j++;
    }
  }

  underLined[j] = '\0';
  strcpy(output, underLined);
  return;
}

void underline_to_camelcase(char *input, char *output) {
  int i = 0;
  int j, tam = strlen(input);
  
  input[0] = toupper(input[0]);
  while(i < tam){
    if(input[i] == '_'){
      input[i] = toupper(input[i+1]);
      j = i+1;
      while(j < tam){
        input[j] = input[j+1];
        j++;
      }
    }
    i++;
  }

  strcpy(output, input);
  return;
}




