%{

#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);

#define YYERROR_VERBOSE

unsigned int i = 0;
void yyerror(char* s);
int yylex();
extern int yylineno;
extern FILE* yyin;
extern void yylex_destroy();

%}

%token ALGORITMO
%token INICIO
%token VAR
%token FIMALGORITMO
%token LEIA
%token CARACTER
%token INTEIRO
%token LOGICO
%token SE
%token ENTAO
%token SENAO
%token FIMSE
%token CASO
%token ESCOLHA
%token PARA
%token FIMPARA
%token FIMESCOLHA
%token ENQUANTO
%token FIMENQUANTO
%token REPITA
%token FIMPROCEDIMENTO
%token ESCREVAL
%token ESCREVA
%token E
%token OU
%token NAO
%token XOU
%token ATRIBUI
%token MAIOR
%token MAIOR_IGUAL
%token IGUAL
%token MENOR
%token MENOR_IGUAL
%token DIFERENTE
%token SOMA
%token SUB
%token MUL
%token DIV
%token VIG
%token PONTO_VIG
%token FECHA_PAR
%token ABRE_PAR
%token LITERAL
%token STRING
%token DOIS_PONTOS
%token NUMERO
%token REAL


%%

inicio: declaracao_Algoritmo{ printf("SUCESSO\n"); }

declaracao_Algoritmo: ALGORITMO STRING VAR INICIO FIMALGORITMO{  }

%%

int main(int argc, char** argv){
    FILE *f = fopen(argv[i], "r");

    if(!f) {
        return (1);
    }
    yyparse();
    printf("Arquivo reconhecido com sucesso\n");
    fclose(f);
}

void yyerror(char* s){
    printf("%s\n", s);
    printf("linha %d\n", yylineno);
}