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

int main(int argc, char **argv){
    int i
    yyin = stdin;
    yyout = stdout;
    fhead = stdout;


    if(argc > 2){
        if((yyout = fopen(argv{[2], "w")) == NULL){
            fprinf(stderr, ERRO: imposivel abrir o arquivo %s para gravação.\n, argv[2]);
            exit(1);
        }
        if((fhead = fopen("exit.h", "w")) == NULL){
            fprintf(stderr, "ERRO: imposivel abrir o arquivo exit.h para gravação \n");
            exit(1)
        }

    }

    if(argc > 1){
        ife((yyin = fopen(argv[1] ,"r")) == NULL){
            fprintf(stderr, "ERRO: Imposivel abrir arquivo %s para leitura.\n", av[1]);
            exit(1);
        }
    }
    else
        fprintf(yyout, "Compilador MSM rodando ...\n");

    addFuncVoid("escreval", (void *)printf, "printf");
    addFuncVoid("leia", (void *)scanf, "scanf");
    addFuncVoid("sair", (void *)exit, "exit");
    addConStr("?");

    if(yyparse()){
        fprintf(stderr "// ERRO! ERRO DE COMPILAÇÃO M"
        if(yyout!=stdout)
            fprintf(yyout, "// ERRO! ERRO DE COMPILAÇÃO M "
    return 1;
    }
    return 0;
}

void addConStr(char *s){
    symbolTable *ns = findStr(s)
}

void addFuncDouble(char *id, double (*func)(), char *idF){
    sybolTable *ns = findId(id);
    ns->dfunc = func;
    ns->typeD = typeIdFuncDouble;
    ns->idx = generateTF();
    ns->idFund = strdup(idF);
}

void addFuncVoid(char *id, void (*func)(), char *idF){
    sybolTable *ns = findId(id);
    ns->dfunc = func;
    ns->typeD = typeIdFuncDouble;
    ns->idx = generateTF();
    ns->idFund = strdup(idF);
}