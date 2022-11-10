%option yylineno
%x COMMENT

%%

[Aa]lgoritmo     {printf("PALAVRARESERVADA %s \n", yytext);}
[Vv]ar           {printf("PALAVRARESERVADA %s \n", yytext);}
[Ii]nicio        {printf("PALAVRARESERVADA %s \n", yytext);}
[Ll]eia          {printf("PALAVRARESERVADA %s \n", yytext);}
[Ff]imalgoritmo  {printf("PALAVRARESERVADA %s \n", yytext);}

[Cc]aracter      {printf("TIPODEDADO %s \n", yytext);}
[Rr]eal          {printf("TIPODEDADO %s \n", yytext);}
[Ii]nteiro       {printf("TIPODEDADO %s \n", yytext);}
[Ll]ogico        {printf("TIPODEDADO %s \n", yytext);}

[Ss]e           {printf("OPERADORCONDICIONAL %s \n", yytext);}
[Ee]ntao        {printf("OPERADORCONDICIONAL %s \n", yytext);}
[Ss]enao        {printf("OPERADORCONDICIONAL %s \n", yytext);}
[Cc]aso         {printf("OPERADORCONDICIONAL %s \n", yytext);}
[Ee]scolha      {printf("OPERADORCONDICIONAL %s \n", yytext);}

[Pp]ara           {printf("ESTRUTURADEREPITICAO %s \n", yytext);}
[Ee]nquanto       {printf("ESTRUTURADEREPITICAO %s \n", yytext);}

[Ff]impara         {printf("FIMBLOCO %s \n", yytext);}
[Ff]imescolha      {printf("FIMBLOCO %s \n", yytext);}
[Ff]imemquanto     {printf("FIMBLOCO %s \n", yytext);}
[Ff]imse          {printf("FIMBLOCO %s \n", yytext);}
[Ff]impara        {printf("FIMBLOCO %s \n", yytext);}
[Ff]imescolha      {printf("FIMBLOCO %s \n", yytext);}
[Ff]imemquanto     {printf("FIMBLOCO %s \n", yytext);}

[Ee]screva         {printf("IDENTIFICADOR %s \n", yytext);}
[Ee]screval        {printf("IDENTIFICADOR %s \n", yytext);}

e              {printf("OPERADORLOGICO %s \n", yytext);}
ou             {printf("OPERADORLOGICO %s \n", yytext);}
nao            {printf("OPERADORLOGICO %s \n", yytext);}
xou            {printf("OPERADORLOGICO %s \n", yytext);}

=              {printf("ATRIBUIDOR %s \n", yytext);}

">"              {printf("OPERADORRELACIONAIS %s \n", yytext);}
">="             {printf("OPERADORRELACIONAIS %s \n", yytext);}
"=="             {printf("OPERADORRELACIONAIS %s \n", yytext);}
"<"              {printf("OPERADORRELACIONAIS %s \n", yytext);}
"<="             {printf("OPERADORRELACIONAIS %s \n", yytext);}

"+"              {printf("OPERADORARITIMETICO %s \n", yytext);}
"-"              {printf("OPERADORARITIMETICO %s \n", yytext);}
"*"              {printf("OPERADORARITIMETICO %s \n", yytext);}
"/"              {printf("OPERADORARITIMETICO %s \n", yytext);}
"|"              {printf("OPERADORARITIMETICO %s \n", yytext);}
","              {printf("OPERADORARITIMETICO %s \n", yytext);}
"%"              {printf("OPERADORARITIMETICO %s \n", yytext);}

";"              {printf("SIMBOLOESPECIAL %s \n", yytext);}
"("              {printf("SIMBOLOESPECIAL %s \n", yytext);}
")"              {printf("SIMBOLOESPECIAL %s \n", yytext);}
":"              {printf("SIMBOLOESPECIAL %s \n", yytext);}

[a-zA-Z][a-zA-Z0-9&%$?-]*        {printf("VARIAVEL %s \n", yytext);}

["]([^"\\\n]|\\(.|\n))*["]       {printf("LITERAL %s \n", yytext);}

\-?[0-9]+                        {printf("INTEIRO %s \n", yytext);}

\-?[0-9]+\.[0-9]+                {printf("REAL" %s \n", yytext);}
\-?[0-9]+\.[0-9]+\E\-?[0-9]+     {printf("REAL" %s \n", yytext);}

[ \t\v\n\f]		 { }


"/*"                   { BEGIN(COMMENT); }
<COMMENT>"*/"          { BEGIN(INITIAL); }
<COMMENT>([^*]|\n)+|.  { }
<COMMENT><<EOF>>       { }

"//".*\n {}


%%


int main( int argc, char **argv ) {
     ++argv, --argc;  /* skip over program name */
     if ( argc > 0 ) {
        yyin = fopen( argv[0], "r" );
     } else { 
        yyin = stdin;
     }

     return yylex();
 }
