#include "ccc_lib.h"
#include <ctype.h> /*Transformar maiusculas em minusculas*/

void camelcase_to_underline(char *input, char *output) {
  int j = 1;

  output[0] = tolower(input[0]);

  for(int i = 1; input[i] != '\0'; i++){
    if(input[i] >= 65 && input[i] <= 90){
      /*Caso seja uma letra maiscula*/
      output[j++] = '_';
      output[j++] = tolower(input[i]);
    }
    else{
      output[j] = input[i];
      j++;
    }
  }

  output[j] = '\0';
  return;
}

void underline_to_camelcase(char *input, char *output) {
  int i = 1;
  int j = 1;

  output[0] = toupper(input[0]);
  while(input[i] != '\0'){
    if(input[i] == '_'){
      output[j] = toupper(input[i+1]);
      i++;
    }
    else{
      output[j] = input[i];
    }
    i++;
    j++;
  }

  output[j] = '\0';
  return;
}