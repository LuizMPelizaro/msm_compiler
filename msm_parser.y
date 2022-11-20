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
%token FACA
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

comando_enquanto:
        | instrucoes ENQUANTO expressao_logica FACA instrucoes FIMENQUANTO
        | ENQUANTO expressao_logica FACA instrucoes FIMENQUANTO
        ;

comando_para:
	| instrucoes PARA expressao_logica FACA instrucoes FIMPARA
	| PARA expressao_logica FACA instrucoes FIMPARA
	;

//comando_escolha:
//	| instrucoes ESCOLHA variaveis comando_caso instrucoes FIMESCOLHA
//	| ESCOLHA variaveis comando_caso instrucoes FIMESCOLHA
//	;
//
//comando_caso:
//	| instrucoes CASO STRING instrucoes
//	| CASO STRING instrucoes
//	;

alternativa:
	| SENAO instrucoes
	;

instrucoes: 
        | instrucoes nome_var assinatura_operador tipo_atribuir
        | escreval
        | escreva
        | leia
        | comando_se
        | comando_enquanto
//        | comando_para
//        | comando_escolha
        ;

escreval:
	| ESCREVAL ABRE_PAR STRING FECHA_PAR
	| ESCREVAL ABRE_PAR palavras FECHA_PAR
	;

escreva:
	| ESCREVA ABRE_PAR STRING FECHA_PAR
	| ESCREVA ABRE_PAR palavras FECHA_PAR
	;

leia:
	| LEIA ABRE_PAR tipo_atribuir FECHA_PAR
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
	|palavras
	|tipo_atribuir
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