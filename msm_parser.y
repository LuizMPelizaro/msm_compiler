%{

#include <stdio.h>
#include <stdlib.h>

#define YYERROR_VERBOSE

void yyerror(char *s);

unsigned int i = 0;
int yylex();

extern int yylineno;
extern FILE *yyin;
extern void yylex_destroy();

%}

%token ALGORITMO
%token FIMALGORITMO
%token INICIO
%token VAR


%token LEIA
%token ESCREVA
%token ESCREVAL


%token SE
%token ENTAO
%token SENAO
%token FIMSE


%token PARA
%token DE
%token ATE
%token FACA
%token FIMPARA
%token ENQUANTO
%token FIMENQUANTO


%token TIPO_CARACTER
%token TIPO_REAL
%token TIPO_INTEIRO
%token TIPO_LOGICO


%token LOGICO


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
%token ABRE_PAR
%token FECHA_PAR
%token DOIS_PONTOS


%token LITERAL
%token STRING
%token NUMERO
%token REAL

%%

inicio: declaracao_Algoritmo{ printf("SUCESSO\n"); }

declaracao_Algoritmo: ALGORITMO STRING VAR variavel INICIO instrucoes FIMALGORITMO{  }


/*--------------Bloco de variaveis--------------*/

tipo_dado: TIPO_CARACTER
        | TIPO_REAL
        | TIPO_INTEIRO
        | TIPO_LOGICO
        ;

nome_var: LITERAL
        | nome_var VIG LITERAL
        ;

variavel: nome_var DOIS_PONTOS tipo_dado
        | variavel nome_var DOIS_PONTOS tipo_dado
        ;


/*--------------Bloco de codigo--------------*/


instrucoes:
        | instrucoes expressao
        | instrucoes escreval
        | instrucoes escreva
        | instrucoes comando_se
        | instrucoes comando_enquanto
        | instrucoes comando_para
        | instrucoes leia
        ;


escreval:  ESCREVAL ABRE_PAR palavras FECHA_PAR
          |  ESCREVAL ABRE_PAR palavras VIG palavras FECHA_PAR
          ;


escreva:  ESCREVA ABRE_PAR palavras FECHA_PAR ;


leia:  LEIA ABRE_PAR nome_var FECHA_PAR;


expressao: expressao assinatura_operador expressao
           |  ABRE_PAR expressao FECHA_PAR
           | palavras
           ;


alternativa: SENAO instrucoes;


comando_se:   SE expressao ENTAO instrucoes FIMSE
             |  SE expressao ENTAO instrucoes alternativa FIMSE
	           ;


comando_enquanto:  ENQUANTO expressao FACA instrucoes FIMENQUANTO
                ;


comando_para:  PARA expressao DE palavras ATE palavras FACA instrucoes FIMPARA
	            ;


assinatura_operador: ATRIBUIR
        | MAIOR
        | MAIOR_IGUAL
        | IGUAL
        | MENOR
        | MENOR_IGUAL
        | DIFERENTE
        | SOMA
        | SUB
        | MUL
        | DIV
        | E
        | XOU
        | OU
        | NAO
        ;


palavras: LITERAL
        | tipo_dado
        | STRING
        | NUMERO
        ;

%%

int main(int argc, char **argv){
    yyin = fopen(argv[1], "r");

    if(!yyin) {
        return (1);
    }
    yyparse();
    printf("Arquivo reconhecido com sucesso\n");
    fclose(yyin);
}

void yyerror(char* s){
    printf("%s\n", s);
    printf("linha %d\n", yylineno);
}