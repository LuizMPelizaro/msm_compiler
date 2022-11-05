D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%%
"algoritimo"    {printf("PALAVRARESERVADA");}
"var"           {printf("PALAVRARESERVADA");}
"inicio"        {printf("PALAVRARESERVADA");}
"fimalgoritimo" {printf("PALAVRARESERVADA");}


"se"            {printf("OPERADORCONDICIONAL");}
"entao"         {printf("OPERADORCONDICIONAL");}
"senao"         {printf("OPERADORCONDICIONAL");}
"fimse"         {printf("OPERADORCONDICIONAL");}
"caso"          {printf("OPERADORCONDICIONAL");}
"escolha"       {printf("OPERADORCONDICIONAL");}

"para"            {printf("ESTRUTURADEREPITICAO");}
"fimpara"         {printf("ESTRUTURADEREPITICAO");}
"fimescolha"      {printf("ESTRUTURADEREPITICAO");}
"enquanto"        {printf("ESTRUTURADEREPITICAO");}
"fimemquanto"     {printf("ESTRUTURADEREPITICAO");}
"repita"          {printf("ESTRUTURADEREPITICAO");}
"fimprocedimento" {printf("ESTRUTURADEREPITICAO");}


"escreva"         {printf("IDENTIFICADOR");}
"escreval"        {printf("IDENTIFICADOR");}

"e"              {printf("OPERADORLOGICO");}
"ou"             {printf("OPERADORLOGICO");}
"nao"            {printf("OPERADORLOGICO");}
"xou"            {printf("OPERADORLOGICO");}

">"              {printf("OPERADORRELACIONAIS");}
">="             {printf("OPERADORRELACIONAIS");}
"=="             {printf("OPERADORRELACIONAIS");}
"<"              {printf("OPERADORRELACIONAIS");}
"<="             {printf("OPERADORRELACIONAIS");}

"+"              {printf("OPERADORARITIMETICO");}
"-"              {printf("OPERADORARITIMETICO");}
"*"              {printf("OPERADORARITIMETICO");}
"/"              {printf("OPERADORARITIMETICO");}
"="              {printf("OPERADORARITIMETICO");}
"|"              {printf("OPERADORARITIMETICO");}
","              {printf("OPERADORARITIMETICO");}

";"              {printf("SIMBOLOESPECIAL");}
"("              {printf("SIMBOLOESPECIAL");}
")"              {printf("SIMBOLOESPECIAL");}

%%

main (int argc, char **argv)
{
    yylex();
}