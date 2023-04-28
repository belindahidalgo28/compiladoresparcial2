package codigo;
import static codigo.Tokens.*;
/* Sección de declaraciones de JFlex */
%%
%class Lexer
%type Tokens

C="/" [^] ~"/" | "/" "*"+ "/"
espacio=[ ,\t,\r,\n]+
N="//".+|"// "
L=[a-zA-Z][a-zA-Z]*
B=[A-Za-z0-9][A-Za-z0-9]*

numero=[0-9]+
real={numero}"."{numero}

espacioo=[ ,\t,\r,\n]+
%{
    public String lexeme;
%}
%%

/* Salto de linea */
( "\n" ) {return SaltoLinea;}

/* Llave de apertura */
( "{" ) {lexeme=yytext(); return LlaveA;}



/* Llave de cierre */
( "}" ) {lexeme=yytext(); return LlaveC;}

/* Dospuntos */
( ":" ) {lexeme=yytext(); return DosP;}

/* Operador Negativo */
( "-" ) {lexeme=yytext(); return Negativo;}

/* Coma */
( "," ) {lexeme=yytext(); return Coma;}

/* Corchete de apertura */
( "[" ) {lexeme=yytext(); return CorcheteA;}

/* Corchete de cierre */
( "]" ) {lexeme=yytext(); return CorcheteC;}

/* Comillas Dobles*/
( "\"" ) {lexeme=yytext(); return ComillasD;}

/* Comillas Simples*/
( "\'" ) {lexeme=yytext(); return ComillasS;}

/* Espacio*/
( " "+ ) {lexeme=yytext(); return Espacio;}

/* Real */
{real} {lexeme=yytext(); return Real;}

/* Real */
{espacioo} {lexeme=yytext(); return Espacioo;}

/* Negativo */
"-" {numero} {lexeme=yytext(); return Negativo;}

/* Alfanumerico */
{L}{numero} {lexeme=yytext(); return Alfanumerico;}

/* Cmentariobloque */
{C} {lexeme=yytext(); return ComentarioB;}

/* Cmentariolinea */
{N} {lexeme=yytext(); return ComentarioN;}

/* ID */
{L}({L}|{numero})* {lexeme=yytext(); return ID;}

/* VAL */
"\"" ({numero}|{L}|{espacio})+"\"" {lexeme=yytext(); return VAL;}


/* Numero */
{numero} {lexeme=yytext(); return Numero;}



/* Alfanumerico */
{B}{espacio}{B} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B} {lexeme=yytext(); return Alfanumerico;}

{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio}{B}{espacio} {lexeme=yytext(); return Alfanumerico;}

/* Error de analisis */
 . {return Error;}

