%{
/*
NOME: GUILHERME DE BRITO ABREU
RA: 173691

DESCRICAO: Dois estilos muito utilizados na programacao sao o uso de underlines e o uso de capitalizacao. Dois exemplos deles sao: isto_eh_underline e IstoEhCamelCase. 
Nesta tarefa, voce devera escrever um programa em Lex que recebe um texto como entrada e converte todas as palavras escritas em CamelCase para notacao underline e vice-versa. 
Se o programa encontrar alguma palavra que misture CamelCase e underline, devera imprimir na tela somente a mensagem: ERRO.
*/

#include <stdio.h>
#include "ccc_lib.h"
#include <stdlib.h>
#include <string.h>

%}

UNDERLINE [a-z]+([_][a-z]+)+
CAMELCASE [A-Z][a-z]+([A-Z][a-z]+)+
CAMELCASE_MIXED_UNDERLINE {CAMELCASE}{UNDERLINE}
UNDERLINE_MIXED_CAMELCASE {UNDERLINE}{CAMELCASE}

%%

{UNDERLINE} {
  char camelCased[strlen(yytext)];
  underline_to_camelcase(yytext, camelCased);
  printf("%s\n", camelCased);
}

{CAMELCASE} {
  char *underlined = malloc(2*strlen(yytext)*sizeof(char));
  camelcase_to_underline(yytext, underlined);
  printf("%s\n", underlined);

  free(underlined);
}

{UNDERLINE_MIXED_CAMELCASE} {
  printf("ERRO\n");
}

{CAMELCASE_MIXED_UNDERLINE} {
  printf("ERRO\n");
}

[.\n]* ;
. ;

%%

int main() {
  yylex();
  return 0;
}