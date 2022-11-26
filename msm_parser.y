%{

#include <stdio.h>
#include <stdlib.h>

void yyerror(char *s);

#define YYERROR_VERBOSE

unsigned int i = 0;
void yyerror(char* s);
int yylex();
extern int yylineno;
extern FILE *yyin;
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
%token PARA
%token DE
%token ATE
%token FIMPARA
%token ENQUANTO
%token FACA
%token FIMENQUANTO
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
tipo_var: CARACTER
        | TIPO_REAL
        | INTEIRO
        | TIPO_LOGICO
        ;

nome_var: LITERAL
        | nome_var VIG LITERAL
        ;

variaveis: nome_var DOIS_PONTOS tipo_var
        | variaveis nome_var DOIS_PONTOS tipo_var
        ;

/*Bloco de codigo*/

instrucoes:
        |  instrucoes nome_var assinatura_operador expressao
        |  expressao
        |  instrucoes nome_var assinatura_operador expressao
        |  escreval
        |  escreva
        |  comando_se
        |  comando_enquanto
        |  comando_para
        |  leia
        ;

escreval: instrucoes ESCREVAL ABRE_PAR palavras FECHA_PAR
          | instrucoes ESCREVAL ABRE_PAR palavras VIG palavras FECHA_PAR
          ;

escreva: instrucoes ESCREVA ABRE_PAR palavras FECHA_PAR ;

leia: instrucoes LEIA ABRE_PAR nome_var FECHA_PAR;

expressao: expressao assinatura_operador expressao
    |ABRE_PAR expressao FECHA_PAR
    |palavras
    |tipo_atribuir
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

tipo_atribuir: REAL
        | LOGICO
        | NUMERO
        | nome_var
        ;

palavras: nome_var
        | STRING
        ;

alternativa:
	|SENAO instrucoes;

comando_se:  instrucoes SE expressao ENTAO instrucoes alternativa FIMSE
	    ;

comando_enquanto: ENQUANTO expressao FACA instrucoes FIMENQUANTO ;

comando_para: instrucoes PARA expressao DE tipo_atribuir ATE tipo_atribuir FACA instrucoes FIMPARA
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