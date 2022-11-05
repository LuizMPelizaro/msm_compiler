comp: comp_flex
	gcc lex.yy.c -lfl -o msm_scaner.exe

comp_flex: clear
	flex  msm_lexer.l

clear:
	rm -f lex.yy.c a.out