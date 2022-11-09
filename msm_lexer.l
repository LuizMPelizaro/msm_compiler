%{
#include "msm_parser.tab.h"
#include <stdio.h>

void unexpectedCharacter(char c)
{
    fprintf(stderr, "lexical error, unexpected character '%c' on line %d\n", c, yylineno);
    exit(EXIT_FAILURE);
}

%}

%%

"Algoritmo"    {return(ALGORITMO);}
"algoritmo"    {return(ALGORITMO);}

"Var"           {return(VAR);}
"var"           {return(VAR);}

"Inicio"        {return(INICIO);}
"inicio"        {return(INICIO);}

"Fimalgoritmo"  {return(FIMALGORITMO);}
"fimalgoritmo"  {return(FIMALGORITMO);}

"Leia"          {return(LEIA);}
"leia"          {return(LEIA);}

"Caractere"      {return(CARACTERE);}
"caractere"      {return(CARACTERE);}

"Real"          {return(REAL);}
"real"          {return(REAL);}

"Inteiro"       {return(INTEIRO);}
"inteiro"       {return(INTEIRO);}

"Logico"        {return(LOGICO);}
"logico"        {return(LOGICO);}


"Se"            {return(SE);}
"se"            {return(SE);}

"Entao"         {return(ENTAO);}
"entao"         {return(ENTAO);}

"Senao"         {return(SENAO);}
"senao"         {return(SENAO);}

"Fimse"         {return(FIMSE);}
"fimse"         {return(FIMSE);}

"Caso"          {return(CASO);}
"caso"          {return(CASO);}

"Escolha"       {return(ESCOLHA);}
"escolha"       {return(ESCOLHA);}

"Para"            {return(PARA);}
"para"            {return(PARA);}

"fimpara"         {return(FIMPARA);}
"Fimpara"         {return(FIMPARA);}

"fimescolha"      {return(FIMESCOLHA);}
"Fimescolha"      {return(FIMESCOLHA);}

"Enquanto"        {return(ENQUANTO);}
"enquanto"        {return(ENQUANTO);}

"fimenquanto"     {return(FIM_ENQUANTO);}
"Fimenquanto"     {return(FIM_ENQUANTO);}

"Repita"          {return(REPITA);}
"repita"          {return(REPITA);}

"fimprocedimento" {return(FIMPROCEDIMENTO);}
"Fimprocedimento" {return(FIMPROCEDIMENTO);}

"Escreval"        {return(ESCREVAL);}
"escreval"        {return(ESCREVAL);}

"Escreva"         {return(ESCREVA);}
"escreva"         {return(ESCREVA);}

":"              {return(DOIS_PONTOS);}

"e"              {return(LOGICO_E);}
"ou"             {return(LOGICO_OU);}
"nao"            {return(LOGICO_NAO);}
"xou"            {return(LOGICO_OU_EXCLUSIVO);}

"<-"             {return(ATRIBUI);}
"="              {return(ATRIBUI);}

">"              {return(MAIOR);}
">="             {return(MAIOR_IGUAL);}
"=="             {return(IGUAL);}
"<"              {return(MENOR);}
"<="             {return(MENOR_IGUAL);}
"=/="            {return(DIFERENTE);}

"+"              {return(MAIS);}
"-"              {return(MENOS);}
"*"              {return(MULTIPLICA);}
"/"              {return(DIVIDE);}

","              {return(VIRGULA);}
";"              {return(SEMICOLON);}

"("              {return(L_PAREN);}
")"              {return(R_PAREN);}

"["              {return(L_SQUARE_BRACKET);}
"]"              {return(L_SQUARE_BRACKET);}

"faca"           {return(FACA);}
"Faca"           {return(FACA);}

"retorne"        {return(RETORNE);}
"Retorne"        {return(RETORNE);}


[a-zA-Z][a-zA-Z0-9&%$?-]*   {return(IDENTIFICADOR);}

\"([^\\\"]|\\.)*\"	        {return(STRING);}

\-?[0-9]+                   {return(NUMERO_INTEIRO);}


" "		{ }
"\t"        {}
"//"(.)*"\n"	{}
"\n"		{}

%%
