D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%%

"algoritimo"    {printf("PALAVRARESERVADA %s \n", yytext);}
"var"           {printf("PALAVRARESERVADA %s \n", yytext);}
"inicio"        {printf("PALAVRARESERVADA %s \n", yytext);}
"fimalgoritimo" {printf("PALAVRARESERVADA %s \n", yytext);}
"Leia"          {printf("PALAVRARESERVADA %s \n", yytext);}


"se"            {printf("OPERADORCONDICIONAL %s \n", yytext);}
"entao"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"senao"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"fimse"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"caso"          {printf("OPERADORCONDICIONAL %s \n", yytext);}
"escolha"       {printf("OPERADORCONDICIONAL %s \n", yytext);}

"para"            {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimpara"         {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimescolha"      {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"enquanto"        {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimemquanto"     {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"repita"          {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimprocedimento" {printf("ESTRUTURADEREPITICAO %s \n", yytext);}


"Escreva"         {printf("IDENTIFICADOR %s \n", yytext);}
"Escreval"        {printf("IDENTIFICADOR %s \n", yytext);}

"e"              {printf("OPERADORLOGICO %s \n", yytext);}
"ou"             {printf("OPERADORLOGICO %s \n", yytext);}
"nao"            {printf("OPERADORLOGICO %s \n", yytext);}
"xou"            {printf("OPERADORLOGICO %s \n", yytext);}

"<-"            {printf("ATRIBUIDOR %s \n", yytext);}

">"              {printf("OPERADORRELACIONAIS %s \n", yytext);}
">="             {printf("OPERADORRELACIONAIS %s \n", yytext);}
"=="             {printf("OPERADORRELACIONAIS %s \n", yytext);}
"<"              {printf("OPERADORRELACIONAIS %s \n", yytext);}
"<="             {printf("OPERADORRELACIONAIS %s \n", yytext);}

"+"              {printf("OPERADORARITIMETICO %s \n", yytext);}
"-"              {printf("OPERADORARITIMETICO %s \n", yytext);}
"*"              {printf("OPERADORARITIMETICO %s \n", yytext);}
"/"              {printf("OPERADORARITIMETICO %s \n", yytext);}
"="              {printf("OPERADORARITIMETICO %s \n", yytext);}
"|"              {printf("OPERADORARITIMETICO %s \n", yytext);}
","              {printf("OPERADORARITIMETICO %s \n", yytext);}

";"              {printf("SIMBOLOESPECIAL %s \n", yytext);}
"("              {printf("SIMBOLOESPECIAL %s \n", yytext);}
")"              {printf("SIMBOLOESPECIAL %s \n", yytext);}


[a-zA-Z][a-zA-Z0-9&%$?-]*        {printf("VARIAVEL %s \n", yytext);}

["]([^"\\\n]|\\(.|\n))*["]       {printf("LITERAL %s \n", yytext);}

\-?[0-9]+                        {printf("INTEIRO %s \n", yytext);}

[\t] {}
[ ] {}
","
%%

 main( argc, argv )
 int argc;
 char **argv;
 {
     ++argv, --argc;  /* skip over program name */
     if ( argc > 0 )
             yyin = fopen( argv[0], "r" );
     else
             yyin = stdin;

     yylex();
 }