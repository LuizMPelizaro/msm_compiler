PROG = MSM

compilar: clear parser scanner
	gcc -o ${PROG}.exe ${PROG}.tab.c ${PROG}.yy.c -std=c89 -lfl

parser:
	bison -d ${PROG}.y

scanner:
	flex -o ${PROG}.yy.c ${PROG}.lex

clear:
	rm -f *.exe *.output *.tab.* *.yy.c
