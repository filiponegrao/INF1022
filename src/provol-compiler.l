%option yywrap
      #include <stdio.h>
      #include <string.h>
      #include "provol-compiler.tab.h"
%%

ENTRADA		return(ENTRADA);
SAIDA		return(SAIDA);
FACA 		return(FACA);
ENQUANTO	return(ENQUANTO);
ENTAO		return(ENTAO);
VEZES		return(VEZES);
"="			return(IGUAL);
SENAO		return(SENAO);
SE 			return(SE);
INC    		return(INC);
FIM     	return(FIM);
ZERA      	return(ZERA);
FIMENQUANTO return(FIMENQUANTO);
FIMFACA		return(FIMFACA);
FIMSEENTAO	return(FIMSEENTAO);
[a-zA-Z]+ 	{ yylval.str = strdup(yytext); return ID; }
