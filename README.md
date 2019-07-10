**Objetivo:**

1 - Criar um arquivo .l que define todos os símbolos possíveis da linguagem Provol-One.

2 - Criar um arquivo .y que define a regra de criação do xml de um automato feito no JFlap a partir de elementos da linguagem Provol-One. Para entender melhor vamos aos exemplo:

**Exemplos:**

No Exemplo 1, rode o comando build.sh através de um terminal.
UnixOS: bash build.sh

O exemplo 1 é uma calculadora que funciona com uma entrada de 1 ou 2 inputs.
Para executá-la rode ./addiercarbonel, e insira os inputs:

1

+2

ATENÇÃO: INSIRA UMA LINHA DE CADA VEZ

O output é a soma, e o código que faz essa soma é em C, definido no arquivo.y

No exemplo 2, rode o comando build.sh também.
O programa recebe uma entrada que representa um programa em uma pseudo-linguagem, e tem como objetivo concatenar strings. Rode o programa com ./sequencia:

Use o conteúdo do arquivo teste.txt como input. O programa recebe a sintaxe de uma pseudo-linguagem que concatena strings.
ATENÇÃO: COPIE E COLE TODO O CONTEÚDO, OS ENTERS SÃO NECESSÁRIOS

**Como funciona:**

1 - O programa irá receber uma string que representa a linguagem Provol-One, parecida com a do exemplo 2;

2 - O programa irá reconhecer cada símbolo da linguagem como um token e seus devidos paramêtros (feito no arquivo .y).
Básicamente o programa verifica se a entrada esta de acordo com a definicao incial da linguagem. No exemplo 2, esta no arquivo sequenciacomandos.y na linha 31 (após o "program:").
Se tiver o programa vai fazendo uma derivaçao de baixo pra cima pra validar o input.

3 - Para cada símbolo lído o programa insere um trecho de código e um arquivo .c que será executado posteriormente.
Esse trecho de código é o contido entre { } após a definição de cada token. No exemplo 1 esses códigos somente fazerm operações matemáticas em cima de um valor. No exemplo 2 esses códigos concatenam símbolos, através de alocação de memória e concatenação de strings. Neste trabalho o trecho de código terá que ser um que concatena strings também, mas as strings terão em seu conteúdos as tags XML para a construção do output.

**Etapas:**

1 - Modificar o arquivo .l para aceitar todos os símbolos da Provol-One;
2 - Modificar o arquivo .y para aceitar todos os símbolos da Provol-One; Definir variáveis de strings públicas que contenham símbolos do XML; Modificar regras de construção (leu um termo, vai pra um símbolo terminal ou não terminal); 





