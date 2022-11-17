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
	| instrucoes SE expressao_logica ENTAO instrucoes FIMSE
        | SE expressao_logica ENTAO instrucoes alternativa FIMSE
	;

alternativa:
	| SENAO instrucoes
	;

instrucoes: 
        | escreval
        | escreva
        | leia
        | comando_se
        ;

escreval:
	| ESCREVAL ABRE_PAR STRING FECHA_PAR
	;

escreva:
	| ESCREVA ABRE_PAR STRING FECHA_PAR
	;

leia:
	| LEIA ABRE_PAR FECHA_PAR
	;

expressao_logica:
	|expressao IGUAL expressao
	|expressao MAIOR expressao
	|expressao MENOR expressao
	|expressao MAIOR_IGUAL expressao
	|expressao MENOR_IGUAL expressao
	|expressao DIFERENTE expressao
	;

expressao:
	|expressao SOMA expressao
	|expressao SUB expressao
	|expressao MUL expressao
	|expressao DIV expressao
	|ABRE_PAR expressao FECHA_PAR
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