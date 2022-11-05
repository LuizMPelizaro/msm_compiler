D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*
{%
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <msm_parser.tab.h>

define size 100000

int yylval;
int ajuda_sint = 0;
int ajuda_lex = 0;
int chars = 1;
int token = 0;
int lines = 0;
int chars2 = 1;
int lines2 = 0;
int pula_linha = 0;
int col = 0;

char AUX12[tamanho];
char AUX13[tamanho];

int i=0;

char *string;

void copia_token_erro();
char vets[tamanho];
char vets2[tamanho];

%}
%%

"Algoritimo"    {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ALGORITIMO);}
"algoritimo"    {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ALGORITIMO);}

"Var"           {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(VAR);}
"var"           {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(VAR);}

"Inicio"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(INICIO);}
"inicio"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(INICIO);}

"Fimalgoritmo"  {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMALGORITIMO);}
"fimalgoritmo"  {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMALGORITIMO);}

"Leia"          {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LEIA);}
"leia"          {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LEIA);}

"Caracter"      {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(CARACTER);}
"caracter"      {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(CARACTER);}

"Real"          {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(REAL);}
"real"          {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(REAL);}

"Inteiro"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(INTEIRO);}
"inteiro"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(INTEIRO);}

"Logico"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LOGICO);}
"logico"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LOGICO);}


"Se"            {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(SE);}
"se"            {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(SE);}

"Entao"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ENTAO);}
"entao"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ENTAO);}

"Senao"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(SENAO);}
"senao"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(SENAO);}

"Fimse"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMSE);}
"fimse"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMSE);}

"Caso"          {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(CASO);}
"caso"          {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(CASO);}

"Escolha"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ESCOLHA);}
"escolha"       {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ESCOLHA);}

"Para"            {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(PARA);}
"para"            {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(PARA);}

"fimpara"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMPARA);}
"Fimpara"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMPARA);}

"fimescolha"      {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMESCOLHA);}
"Fimescolha"      {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMESCOLHA);}

"Enquanto"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ENQUANTO);}
"enquanto"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ENQUANTO);}

"fimenquanto"     {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMENQUANTO);}
"Fimenquanto"     {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMENQUANTO);}

"Repita"          {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(REPITA);}
"repita"          {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(REPITA);}

"fimprocedimento" {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMPROCEDIMENTO);}
"Fimprocedimento" {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(FIMPROCEDIMENTO);}

"Escreval"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ESCREVAL);}
"escreval"        {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ESCREVAL);}

"Escreva"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ESCREVA);}
"escreva"         {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ESCREVA);}


"e"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LOGICO_E);}
"ou"             {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LOGICO_OU);}
"nao"            {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LOGICO_NAO);}
"xou"            {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(LOGICO_OU_EXCLUSIVO);}

"<-"             {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ATRIBUI);}
"="              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(ATRIBUI);}

">"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MAIOR);}
">="             {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MAIOR_IGUAL);}
"=="             {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(IGUAL);}
"<"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MENOR);}
"<="             {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MENOR_IGUAL);}
"=/="            {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(DIFERENTE);}

"+"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MAIS);}
"-"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MENOS);}
"*"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(MULTIPLICA);}
"/"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(DIVIDE);}

","              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(VIRGULA);}
";"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(SEMICOLON);}

"("              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(L_PAREN);}
")"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(R_PAREN);}

"["              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(L_SQUARE_BRACKET);}
"]"              {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(L_SQUARE_BRACKET);}


[a-zA-Z][a-zA-Z0-9&%$?-]*    {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(IDENTIFICADOR);}

\"([^\\\"]|\\.)*\"	{strcat(vets, yytext);copia_token_erro(); string = malloc(strlen(yytext)*sizeof(char));
                        strcpy(string, yytext); i = 0;
                        while(string[i] != '\0'){string[i] = string[i+1];i++;} string[i-2] = '\0';
                        chars+=strlen(yytext);token++;return(STRING);}

\-?[0-9]+                    {strcat(vets, yytext);copia_token_erro();chars+=strlen(yytext);token++;return(NUMERO_INTEIRO);}


" "		{ strcat(vets, yytext);copia_token_erro();chars+= strlen(yytext); }
"\t"        { strcat(vets, yytext);copia_token_erro();chars+= strlen(yytext); }
"//"(.)*"\n"	{ strcat(vets, yytext);copia_token_erro();lines++; chars=1; yylineno++;}
"\n"		{ if(ajuda_sint == 1 && ajuda_lex == 0){ajuda_lex=1;strcpy(vets2,vets);}strcpy(vets,"");copia_token_erro();lines++; chars=1; yylineno++;}

%%

void copia_token_erro(){

	int i=0;

    strcat(AUX13,yytext);

	for (i = 0; yytext[i] != '\0'; i++){

		if(yytext[i] == '\n'){

        	strcpy(AUX12,"");
            strcpy(AUX13,"");
            coluna = 0;
        }
		else if(yytext[i] == '\t')
        	coluna += 8 - (coluna % 8);

		else{

        	strcpy(AUX12,yytext);
            coluna++;
        }
    }
}