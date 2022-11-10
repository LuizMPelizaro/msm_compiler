%option yylineno
%x COMMENT
%{
#include "msm_parser.tab.h"
#include <stdio.h>

void unexpectedCharacter(char c)
{
    printf("unexpected character '%c' on line %d\n", c, yylineno);
    exit(EXIT_FAILURE);
}

%}

%%

[Aa]lgoritmo        {return(ALGORITMO);}
[Vv]ar              {return(VAR);}
[Ii]nicio           {return(INICIO);}
[Ll]eia             {return(LEIA);}
[Ff]imalgoritmo     {return(FIMALGORITMO);}


[Cc]aracter         {return(CARACTER);}
[Rr]eal             {return(TIPO_REAL);}
[Ii]nteiro          {return(INTEIRO);}
[Ll]ogico           {return(TIPO_LOGICO);}

[Ss]e               {return(SE);}
[Ee]ntao            {return(ENTAO);}
[Ss]enao            {return(SENAO);}
[Cc]aso             {return(CASO);}
[Ee]scolha          {return(ESCOLHA);}

[Pp]ara             {return(PARA);}
[Ee]nquanto         {return(ENQUANTO);}

[Ff]impara          {return(FIMPARA);}
[Ff]imescolha       {return(FIMESCOLHA);}
[Ff]imemquanto      {return(FIMENQUANTO);}
[Ff]imse            {return(FIMSE);}
[Ff]impara          {return(FIMPARA);}
[Ff]imescolha       {return(FIMESCOLHA);}
[Ff]imemquanto      {return(FIMENQUANTO);}

[Ee]screva          {return(ESCREVA);}
[Ee]screval         {return(ESCREVAL);}

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

"+"                 {return(SOMA);}
"-"                 {return(SUB);}
"*"                 {return(MUL);}
"/"                 {return(DIV);}
","                 {return(VIG);}

";"                 {return(PONTO_VIG);}
"("                 {return(ABRE_PAR);}
")"                 {return(FECHA_PAR);}
":"                 {return(DOIS_PONTOS);}
[Vv]erdadeiro | [Ff]also {return(LOGIGO)}

[a-zA-Z][a-zA-Z0-9&%$?-]*        {return(LITERAL);}

["]([^"\\\n]|\\(.|\n))*["]       {return(STRING);}

\-?[0-9]+                        {return(NUMERO);}

\-?[0-9]+\.[0-9]+                {return(REAL);}
\-?[0-9]+\.[0-9]+\E\-?[0-9]+     {return(REAL);}

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

