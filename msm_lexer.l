%{
    #include <math.h>
    #include <stdlib.h>
    #include "msm.h"
    #include "y.tab.h"

    FILE *fhead=NULL;

%}

%%

int    { return INT; }
real   { return REAL; }
varchar{ return VARCHAR;}
inicio { return INICIO; }
fim    { return FIM; }
se     { return SE; }
entao  { return ENTAO; }
senao  { return SENAO; }
abort  { return ABORTE; }
para   { return ENQUANTO; }

escreval { return ESCREVAL; }
leia     { return LEIA; }
sair     { return SAIR; }

">"      { return MAIOR; }
"<"      { return MENOR; }
"<="     { return MENORIGUAL; }
">="     { return MAIORIGUAL; }
"!="     { return DIFERENTE; }
"=="     { return IGUAL; }
"e"      { return E; }
"ou"     { return OU; }
"nao"    { return NAO; }

[a-zA-Z][a-ZA-Z0-9_]*   {
                        symbolTable *ns = searchId(yytext);
                        yylval.nextSymbol = ns;
                        return VAR;
}

[0-9]+"."[0-9]+([eE][+-]?[0-9]+)?{
                                        symbolTable *ns = searchFloat(atof(yytext));
                                        yylval.nextSymbol = ns;
                                        return FLOAT;
}

[0-9]+                {
                        symbolTable *ns = searchInt(atoi(yytext));
                        yylval.nextSymbol = ns;
                        return INT;
                      }

"\""[^"\n]*"\""     {
                       symbolTable *ns = searchString(yytext);
                       yylval.nextSymbol = ns;
                       return STRING;
                    }

\n       { line++ }
[ \t\r]+ ;
"//".*   ;
.        { yyerror("caracter não reconhecido");}

int yywrap(void){
return 1;
}

void yyerror(char *s){
    fprint(stderr, "->Linha: %d.\nErro: %s Token: '%s'.\n", line, s ,yytext);
}

int main(int ac, char **av){
    int i
    yyin = stdin;
    yyout = stdout;
    fhead = stdout;

}