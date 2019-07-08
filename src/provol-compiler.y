%{
      #include <stdlib.h>
      #include <stdio.h>
      #include <string.h>

// Variavies auxiliares
char * output = "";
char * aux1;
char * aux2;
char * aux3;
char * aux4;
char * temp;
int length = 0;

char * addVariables(char * symbol1, char * symbol2);


int yylex();
void yyerror(const char *s) {
      fprintf(stderr, "%s\n", s);
   };

%}
%union
 {
    char *str;
    int number;
 };
%type<str> program varlist cmds cmd;
%token<str> ID;
%token<number> ENTRADA;
%token<number> SAIDA;
%token<number> INC;
%token<number> ZERA;
%token<number> FACA;
%token<number> VEZES;
%token<number> ENTAO;
%token<number> SE;
%token<number> ENQUANTO;
%token<number> IGUAL;
%token<number> FIM;
%token<number> SENAO;
%token<number> FIMENQUANTO;
%token<number> FIMFACA;
%token<number> FIMSEENTAO;


%start program
%%
program : ENTRADA varlist SAIDA varlist cmds FIM { printf ("Codigo Objeto: \n%s\n", $2); exit(1); };

varlist : ID { $$=$1 };
        | varlist ID { char * result = addVariables($1, $2); $$ = result; printf("Param1: %s", $$)};

cmds    : cmd { $$ = $1; };
        | cmd cmds {  };

cmd     : FACA ID VEZES cmds FIMFACA { };
cmd     : ENQUANTO ID FACA cmds FIMENQUANTO { };
cmd     : SE ID ENTAO cmds SENAO cmds FIMSEENTAO { } ;
        | SE ID ENTAO cmds FIMSEENTAO {};
cmd     : ID IGUAL ID { };
        | INC ID {  };
        | ZERA ID {  };

%%

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}

char * addVariables(char * symbol1, char * symbol2) {

  aux1 = "var ";
  aux2 = " = 0;";
  aux3 = "\n";
  length = strlen(aux1) + strlen(symbol1) + strlen(aux2);
  length += strlen(aux3) + strlen(aux1) + strlen(symbol2) + strlen(aux2) +1;

  char * result = malloc(length);
  strcpy(result, aux1);
  strcat(result, symbol1);
  strcat(result, aux2);
  strcat(result, aux3);
  strcat(result, aux1);
  strcat(result, symbol2);
  strcat(result, aux2);

  temp = malloc(strlen(output) + 1);
  strcpy(temp, output);

  output = malloc(strlen(result) +  strlen(temp) + 1);
  strcpy(output, result);

  char * params = malloc(strlen(symbol1) + strlen(symbol2) + 1);
  strcpy(params, symbol1);
  strcat(params, symbol2);

  return result;
}

