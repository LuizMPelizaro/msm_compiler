%option yylineno
%x COMMENT
%{
#include<stdio.h>
#include<stdlib.h>
#include<string.h>
#include "msm_parser.tab.h"
#include "TabelaSimbolos.h"

void yyerror(char* s);
%}

%%

[Aa]lgoritmo        {return(ALGORITMO);}
[Ff]imalgoritmo     {return(FIMALGORITMO);}
[Ii]nicio           {return(INICIO);}
[Vv]ar              {return(VAR);}


[Ll]eia             {return(LEIA);}
[Ee]screva          {return(ESCREVA);}
[Ee]screval         {return(ESCREVAL);}


[Ss]e               {return(SE);}
[Ee]ntao            {return(ENTAO);}
[Ss]enao            {return(SENAO);}
[Ff]imse            {return(FIMSE);}


[Pp]ara             {return(PARA);}
[Dd]e               {return(DE);}
[Aa]te               {return(ATE);}
[Ff]aca             {return(FACA);}
[Ff]impara          {return(FIMPARA);}
[Ee]nquanto         {return(ENQUANTO);}
[Ff]imenquanto      {return(FIMENQUANTO);}


[Cc]aracter         {return(TIPO_CARACTER);}
[Rr]eal             {return(TIPO_REAL);}
[Ii]nteiro          {return(TIPO_INTEIRO);}
[Ll]ogico           {return(TIPO_LOGICO);}


[Vv]erdadeiro | [Ff]also {return(LOGIGO)}


e                   {return(E);}
ou                  {return(OU);}
nao                 {return(NAO);}
xou                 {return(XOU);}


=                   {return(ATRIBUIR);}


">"                 {return(MAIOR);}
">="                {return(MAIOR_IGUAL);}
"=="                {return(IGUAL);}
"<"                 {return(MENOR);}
"<="                {return(MENOR_IGUAL);}
"!="                {return(DIFERENTE);}


"+"                 {return(SOMA);}
"-"                 {return(SUB);}
"*"                 {return(MUL);}
"/"                 {return(DIV);}


","                 {return(VIG);}
";"                 {return(PONTO_VIG);}
"("                 {return(ABRE_PAR);}
")"                 {return(FECHA_PAR);}
":"                 {return(DOIS_PONTOS);}


[a-zA-Z]_*[a-zA-Z0-9&%$?-_]*        {yylval.literal = malloc(sizeof(char) * (strlen(yytext) + 1));
                                     strcpy(yylval.literal, yytext);
                                     return LITERAL;
                                     }
["]([^"\\\n]|\\(.|\n))*["]       { yylval.caractere = yytext[1]; return(STRING);}
\-?[0-9]+                        { yylval.int = atoi(yytext); return(NUMERO);}
\-?[0-9]+\.[0-9]+                {yylval.float = atof(yytext);return(REAL);}
\-?[0-9]+\.[0-9]+\E\-?[0-9]+     {yylval.float = atof(yytext);return(REAL);}


[ \t\v\n\f]		 { }
"/*"                   { BEGIN(COMMENT); }
<COMMENT>"*/"          { BEGIN(INITIAL); }
<COMMENT>([^*]|\n)+|.  { }
<COMMENT><<EOF>>       { }
"//".*\n {}
" "		{ }
"\t"        {}
"//"(.)*"\n"	{}
"\n"		{}

%%