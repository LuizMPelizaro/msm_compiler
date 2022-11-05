D			[0-9]
L			[a-zA-Z_]
H			[a-fA-F0-9]
E			[Ee][+-]?{D}+
FS			(f|F|l|L)
IS			(u|U|l|L)*

%%

"Algoritimo"    {printf("PALAVRARESERVADA %s \n", yytext);}
"Var"           {printf("PALAVRARESERVADA %s \n", yytext);}
"Inicio"        {printf("PALAVRARESERVADA %s \n", yytext);}
"Fimalgoritmo"  {printf("PALAVRARESERVADA %s \n", yytext);}
"Leia"          {printf("PALAVRARESERVADA %s \n", yytext);}
"algoritimo"    {printf("PALAVRARESERVADA %s \n", yytext);}
"var"           {printf("PALAVRARESERVADA %s \n", yytext);}
"inicio"        {printf("PALAVRARESERVADA %s \n", yytext);}
"fimalgoritmo"  {printf("PALAVRARESERVADA %s \n", yytext);}
"leia"          {printf("PALAVRARESERVADA %s \n", yytext);}

"Caracter"      {printf("TIPODEDADO %s \n", yytext);}
"caracter"      {printf("TIPODEDADO %s \n", yytext);}
"Real"          {printf("TIPODEDADO %s \n", yytext);}
"real"          {printf("TIPODEDADO %s \n", yytext);}
"Inteiro"       {printf("TIPODEDADO %s \n", yytext);}
"inteiro"       {printf("TIPODEDADO %s \n", yytext);}
"Logico"        {printf("TIPODEDADO %s \n", yytext);}
"logico"        {printf("TIPODEDADO %s \n", yytext);}


"Se"            {printf("OPERADORCONDICIONAL %s \n", yytext);}
"Entao"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"Senao"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"Fimse"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"Caso"          {printf("OPERADORCONDICIONAL %s \n", yytext);}
"Escolha"       {printf("OPERADORCONDICIONAL %s \n", yytext);}
"se"            {printf("OPERADORCONDICIONAL %s \n", yytext);}
"entao"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"senao"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"fimse"         {printf("OPERADORCONDICIONAL %s \n", yytext);}
"caso"          {printf("OPERADORCONDICIONAL %s \n", yytext);}
"escolha"       {printf("OPERADORCONDICIONAL %s \n", yytext);}

"Para"            {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimpara"         {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimescolha"      {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"Enquanto"        {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimemquanto"     {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"Repita"          {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimprocedimento" {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"fimse" {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"para"            {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"Fimpara"         {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"Fimescolha"      {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"enquanto"        {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"Fimemquanto"     {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"repita"          {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"Fimprocedimento" {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
"Fimse" {printf("ESTRUTURADEREPITICAO %s \n", yytext);}

"Escreva"         {printf("IDENTIFICADOR %s \n", yytext);}
"Escreval"        {printf("IDENTIFICADOR %s \n", yytext);}
"escreva"         {printf("IDENTIFICADOR %s \n", yytext);}
"escreval"        {printf("IDENTIFICADOR %s \n", yytext);}

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
":"
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