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

UNDERLINE_SENTENCE [a-z]+([_][a-z0-9]+)+
CAMELCASE [A-Z][a-z]+([A-Z][a-z]+)+

CAPITAL_LETTER ([a-z0-9]*[A-Z]+[a-z0-9]*)+
UNDERLINE ([a-z0-9]*[_]+[a-z0-9]*)+

VALID_TOKEN [A-Za-z0-9]+
MIXED_CASE1 ({VALID_TOKEN}\ )*{UNDERLINE}{CAPITAL_LETTER}
MIXED_CASE2 ({VALID_TOKEN}\ )*{CAPITAL_LETTER}{UNDERLINE}

%%
{MIXED_CASE1} {
  printf("ERRO\n");
  exit(1);
}

{MIXED_CASE2} {
  printf("ERRO\n");
  exit(1);
}

{UNDERLINE_SENTENCE} {
  char *camelCased = malloc(strlen(yytext)*sizeof(char));
  underline_to_camelcase(yytext, camelCased);
  printf("%s", camelCased);
  free(camelCased);
}

{CAMELCASE} {
  char *underlined = malloc(2*strlen(yytext)*sizeof(char));
  camelcase_to_underline(yytext, underlined);
  printf("%s", underlined);
  free(underlined);
}

{VALID_TOKEN} {
  printf("%s", yytext);
}

[\n] {
  printf("\n");
}

[ ] {
  printf(" ");
}

. ;
%%

int main() {
  yylex();
  return 0;
}