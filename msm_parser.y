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
%token ATRIBUIR
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
%token TIPO_REAL
%token TIPO_LOGICO

%%

inicio: declaracao_Algoritmo{ printf("SUCESSO\n"); }

declaracao_Algoritmo: ALGORITMO STRING VAR variaveis INICIO instrucoes FIMALGORITMO{  }
/*Bloco de variaveis*/
tipo_var:
        | CARACTER
        | TIPO_REAL
        | INTEIRO
        | TIPO_LOGICO
        ;

nome_var: LITERAL
        | nome_var VIG LITERAL
        ;

variaveis:
        | nome_var DOIS_PONTOS tipo_var
        | variaveis nome_var DOIS_PONTOS tipo_var
        ;

/*Bloco de codigo*/

assinatura_operador:
        | ATRIBUIR
        |MAIOR
        |MAIOR_IGUAL
        | IGUAL
        | MENOR
        | MENOR_IGUAL
        | DIFERENTE
        | SOMA
        | SUB
        | MUL
        | DIV
        ;
tipo_atribuir:
        | REAL
        | STRING
        | LOGICO
        | NUMERO
        ;

palavras:
        | STRING
        | nome_var
        ;

comando_se:
        | SE palavras assinatura_operador ENTAO

instrucoes: 
        | instrucoes nome_var assinatura_operador tipo_atribuir 
        | instrucoes ESCREVA ABRE_PAR palavras FECHA_PAR
        | instrucoes ESCREVAL ABRE_PAR palavras FECHA_PAR
        ;

%%

int main(int argc, char **argv){
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