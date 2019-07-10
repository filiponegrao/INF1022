%{
      #include <stdlib.h>
      #include <stdio.h>
      #include <string.h>

char * result = "";

// Variavies auxiliares
char * aux1;
char * aux2;
char * aux3;
char * aux4;
char * temp;
int length = 0;

char * addHeader(char * s);
char * createVariable(char * symbol1);
char * addVariable(char * symbol2);
char * eraseValue(char * symbol);
char * incValue(char * symbol);
char * addSymbol(char * symbol);
char * equalParams(char * symbol1, char * symbol2);
char * insertFor(char * symbol1, char * symbol2);
void addEndFor();
char * concatenate(char * symbol1, char * symbol2);
char * addIf(char * symbol1, char * symbol2);
void addEndIf();
char * insertWhile(char * symbol1, char * symbol2);
char * addIfElse(char * symbol1, char * symbol2, char * symbol3);
char * assemblyCode(char * symbol1, char * symbol2, char * symbol3);

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
%type<str> program varlist varlist2 cmds cmd;
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
program : ENTRADA varlist SAIDA varlist2 cmds FIM { char * r = assemblyCode($2, $4, $5); printf ("\n\nCodigo Objeto: \n%s", r); exit(1); };

varlist : ID { char * r = createVariable($1); $$=r; };
        | varlist ID { char * r = addVariable($2); result = concatenate($1, r); $$=result;  };

varlist2 : ID { char * r = addSymbol($1); $$=r; };
        | varlist2 ID { char * r = addSymbol($2); result = concatenate($1, r); $$=result };

cmds    : cmd { $$=$1; };
        | cmd cmds {  char * r = concatenate($1, $2); $$=r};


cmd     : FACA ID VEZES cmds FIMFACA { char * r = insertFor($2, $4); $$=r };
cmd     : ENQUANTO ID FACA cmds FIMENQUANTO { char * r = insertWhile($2, $4); r = concatenate(r, "  }\n"); $$=r; result = concatenate(result, r); };
cmd     : SE ID ENTAO cmds SENAO cmds FIMSEENTAO { char * r = addIfElse($2, $4, $6); r = concatenate(r, "\n  }"); $$=r; result = concatenate(result, r);};
        | SE ID ENTAO cmds FIMSEENTAO { char * r = addIf($2, $4);  r = concatenate(r, "  }\n"); $$=r; result = concatenate(result, r);};
cmd     : ID IGUAL ID { char * r = equalParams($1, $3); $$=r; };
        | INC ID { char * r = incValue($2); $$=r;};
        | ZERA ID { char * r = eraseValue($2); $$=r; };

%%

int main(int argc, char *argv[])
{
    yyparse();
    return(0);
}

char * createVariable(char * symbol1) {

  aux1 = "var ";
  aux2 = " = 0;";
  aux3 = "\n";
  length += strlen(aux1) + strlen(symbol1) + strlen(aux2) + strlen(aux3) + 1;

  char * result = malloc(length);
  strcat(result, aux1);
  strcat(result, symbol1);
  strcat(result, aux2);
  strcat(result, aux3);

  return result;
}

char * addVariable(char * symbol) {

  aux1 = "var ";
  aux2 = " = 0;";
  aux3 = "\n";
  length += strlen(aux1) + strlen(symbol) + strlen(aux2) + strlen(aux3) + 1;

  char * r = malloc(length);
  strcat(r, aux1);
  strcat(r, symbol);
  strcat(r, aux2);
  strcat(r, aux3);

  return r;
}

char * eraseValue(char * symbol) {

  aux1 = " = 0;";
  aux2 = "\n  ";
  
  length = strlen(aux2) + strlen(symbol) + strlen(aux1) + 1;

  char * r = malloc(length);
  strcat(r, aux2);
  strcat(r, symbol);
  strcat(r, aux1);

  return r;
}

char * incValue(char * symbol) {

  aux1 = "\n  ";
  aux2 = " += 1;";
  
  length = strlen(symbol) + strlen(aux2) + + strlen(aux1) + 1;

  char * r = malloc(length);
  strcpy(r, aux1);
  strcat(r, symbol);
  strcat(r, aux2);

  return r;
}

char * addHeader(char * s) {

  aux1 = "\npublic main() return ";

  length = strlen(s) + strlen(result) + strlen(aux1) + 1;

  char * r = malloc(length);
  strcpy(r, s);
  strcat(r, aux1);

  return r;
}

void addEndFor() {

  aux1 = "  }\n";

  length = strlen(result) + strlen(aux1) + 1;

  char * r = malloc(length);
  strcpy(r, result);
  strcat(r, aux1);

  result = r;
}

char * addSymbol(char * symbol) {
  
  aux1 = " ";
  length = strlen(aux1) + strlen(symbol) + 1;

  char * r = malloc(length);
  strcat(r, symbol);
  strcat(r, aux1);

  return r;
}

void addCommands() {
  
  aux1 = "{\n";
  length = strlen(result) + strlen(aux1) + 1;

  char * r = malloc(length);
  strcpy(r, result);
  strcat(r, aux1);

  result = r;
}

void addEndIf() {
  
  aux1 = "}\n";
  length = strlen(result) + strlen(aux1) + 1;

  char * r = malloc(length);
  strcpy(r, result);
  strcat(r, aux1);

  result = r;
}

char * equalParams(char * symbol1, char * symbol2) {

  aux1 = "\n  ";
  aux2 = " = ";
  length = strlen(aux1) + strlen(symbol1) + strlen(symbol2) + strlen(aux2) + 1;

  char * r = malloc(length);
  strcpy(r, aux1);
  strcat(r, symbol1);
  strcat(r, aux2);
  strcat(r, symbol2);

  return r;
}

char * insertFor(char * symbol1, char * symbol2) {

  aux1 = "\n";
  aux2 = "  for 1 to ";
  aux3 = " {\n";
  aux4 = "\n  }\n";


  length = strlen(aux1) + strlen(aux2) + strlen(symbol1) + strlen(aux3) + 1;
  length += strlen(symbol2) + strlen(aux4);

  char * r = malloc(length);
  strcpy(r, aux1);
  strcat(r, aux2);
  strcat(r, symbol1);
  strcat(r, aux3);
  strcat(r, symbol2);
  strcat(r, aux4);

  return r;
}

char * insertWhile(char * symbol1, char * symbol2) {

  aux1 = "\n";
  aux2 = "  while ";
  aux3 = " {\n";
  aux4 = "\n  }\n";


  length = strlen(aux1) + strlen(aux2) + strlen(symbol1) + strlen(aux3) + 1;
  length += strlen(symbol2) + strlen(aux4);

  char * r = malloc(length);
  strcpy(r, aux1);
  strcat(r, aux2);
  strcat(r, symbol1);
  strcat(r, aux3);
  strcat(r, symbol2);
  strcat(r, aux4);

  return r;
}

char * concatenate(char * symbol1, char * symbol2) {

  length = strlen(symbol1) + strlen(symbol2) + 1;

  char * r = malloc(length);
  strcpy(r, symbol1);
  strcat(r, symbol2);

  return r;
}

char * addIf(char * symbol1, char * symbol2) {

  aux1 = "\n  if ";
  aux2 = " {";
  aux3 = "\n";

  length = strlen(aux1) + strlen(symbol1) + strlen(aux2) + strlen(symbol2) + strlen(aux3) + 1;

  char * r = malloc(length);
  strcpy(r, aux1);
  strcat(r, symbol1);
  strcat(r, aux2);
  strcat(r, symbol2);
  strcat(r, aux3);

  return r;
}

char * addIfElse(char * symbol1, char * symbol2, char * symbol3) {

  aux1 = "\n  if ";
  aux2 = " {";
  aux4 = "\n  } else {";

  length = strlen(aux1) + strlen(symbol1) + strlen(aux2) + strlen(symbol2) + strlen(aux4) + strlen(symbol3) +1;

  char * r = malloc(length);
  strcpy(r, aux1);
  strcat(r, symbol1);
  strcat(r, aux2);
  strcat(r, symbol2);
  strcat(r, aux4);
  strcat(r, symbol3);

  return r;
}

char * assemblyCode(char * symbol1, char * symbol2, char * symbol3) {

  aux1 = "\n*** INF1022: Pseudo-Código ***\n\n";
  aux2 = "\n\n*** FIM do Pseudo-Código  ****\n\n";

  char * r = concatenate(aux1, symbol1);
  r = addHeader(r);
  r = concatenate(r, symbol2);
  r = concatenate(r, symbol3);
  r = concatenate(r, aux2);


  return r;
}







