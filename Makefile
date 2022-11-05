comp: comp_flex
	gcc lex.yy.c -lfl

comp_flex: clear
	flex  msm_lexer.l

clear:
	rm -f lex.yy.c a.out