comp: clear comp_bison  comp_flex
	gcc lex.yy.c msm_parser.tab.c -lfl  -o msm_scaner.exe

comp_bison:
	bison -d -v msm_parser.y

comp_flex: clear
	flex  msm_lexer.l

clear:
	rm -f lex.yy.c a.out *.tab.c *.tab.h