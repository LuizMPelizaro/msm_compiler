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
%token CARACTERE
%token REAL
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
%token FIM_ENQUANTO
%token REPITA
%token FIMPROCEDIMENTO
%token ESCREVAL
%token ESCREVA
%token LOGICO_E
%token LOGICO_OU
%token LOGICO_NAO
%token LOGICO_OU_EXCLUSIVO
%token ATRIBUI
%token MAIOR
%token MAIOR_IGUAL
%token IGUAL
%token MENOR
%token MENOR_IGUAL
%token DIFERENTE
%token MAIS
%token MENOS
%token MULTIPLICA
%token DIVIDE
%token VIRGULA
%token SEMICOLON
%token L_PAREN
%token R_PAREN
%token L_SQUARE_BRACKET
%token IDENTIFICADOR
%token STRING
%token NUMERO_INTEIRO
%token DOIS_PONTOS
%token RETORNE
%token FACA

%%

inicio: declaracao_Algoritmo{ }

declaracao_Algoritmo: ALGORITMO STRING { printf("SUCESSO"); }

%%

int main(int argc, char** argv){
    FILE *f = fopen(argv[i], "r");

    if(!f) {
        return (1);
    }
//    if(yyerror){
//        yyerror("erro");
//        return (1);
//    }
    printf("Arquivo reconhecido com sucesso\n");
}

void yyerror(char* s){
    printf("%s\n", s);
    printf("linha %d\n", yylineno);
}