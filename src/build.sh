bison -d provol-compiler.y
flex provol-compiler.l
gcc -o compiler lex.yy.c provol-compiler.tab.c -ll
