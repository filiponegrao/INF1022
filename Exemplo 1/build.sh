bison -d addier-carbonel.y
flex addier-carbonel.l
gcc -o addiercarbonel lex.yy.c addier-carbonel.tab.c -ll