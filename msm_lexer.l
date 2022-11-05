D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%%
"algoritimo"    {printf("PALAVRARESERVADA %s", yytext);}
"var"           {printf("PALAVRARESERVADA %s", yytext);}
"inicio"        {printf("PALAVRARESERVADA %s", yytext);}
"fimalgoritimo" {printf("PALAVRARESERVADA %s", yytext);}


"se"            {printf("OPERADORCONDICIONAL %s", yytext);}
"entao"         {printf("OPERADORCONDICIONAL %s", yytext);}
"senao"         {printf("OPERADORCONDICIONAL %s", yytext);}
"fimse"         {printf("OPERADORCONDICIONAL %s", yytext);}
"caso"          {printf("OPERADORCONDICIONAL %s", yytext);}
"escolha"       {printf("OPERADORCONDICIONAL %s", yytext);}

"para"            {printf("ESTRUTURADEREPITICAO %s", yytext);}
"fimpara"         {printf("ESTRUTURADEREPITICAO %s", yytext);}
"fimescolha"      {printf("ESTRUTURADEREPITICAO %s", yytext);}
"enquanto"        {printf("ESTRUTURADEREPITICAO %s", yytext);}
"fimemquanto"     {printf("ESTRUTURADEREPITICAO %s", yytext);}
"repita"          {printf("ESTRUTURADEREPITICAO %s", yytext);}
"fimprocedimento" {printf("ESTRUTURADEREPITICAO %s", yytext);}


"escreva"         {printf("IDENTIFICADOR %s", yytext);}
"escreval"        {printf("IDENTIFICADOR %s", yytext);}

"e"              {printf("OPERADORLOGICO %s", yytext);}
"ou"             {printf("OPERADORLOGICO %s", yytext);}
"nao"            {printf("OPERADORLOGICO %s", yytext);}
"xou"            {printf("OPERADORLOGICO %s", yytext);}

">"              {printf("OPERADORRELACIONAIS %s", yytext);}
">="             {printf("OPERADORRELACIONAIS %s", yytext);}
"=="             {printf("OPERADORRELACIONAIS %s", yytext);}
"<"              {printf("OPERADORRELACIONAIS %s", yytext);}
"<="             {printf("OPERADORRELACIONAIS %s", yytext);}

"+"              {printf("OPERADORARITIMETICO %s", yytext);}
"-"              {printf("OPERADORARITIMETICO %s", yytext);}
"*"              {printf("OPERADORARITIMETICO %s", yytext);}
"/"              {printf("OPERADORARITIMETICO %s", yytext);}
"="              {printf("OPERADORARITIMETICO %s", yytext);}
"|"              {printf("OPERADORARITIMETICO %s", yytext);}
","              {printf("OPERADORARITIMETICO %s", yytext);}

";"              {printf("SIMBOLOESPECIAL %s", yytext);}
"("              {printf("SIMBOLOESPECIAL %s", yytext);}
")"              {printf("SIMBOLOESPECIAL %s", yytext);}

%%

main (int argc, char **argv)
{
    yylex();
}