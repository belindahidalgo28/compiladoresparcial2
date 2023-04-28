package codigo;
import java_cup.runtime.Symbol;
/* Sección de declaraciones de JFlex */
%%
%class LexerCup
%type java_cup.runtime.Symbol
%cup
%full
%line
%char

C="/" [^] ~"/" | "/" "*"+ "/"

N="//".+|"// "
L=[a-zA-Z][a-zA-Z]*
B=[A-Za-z0-9][A-Za-z0-9]*

numero=[0-9]+
real={numero}"."{numero}

espacioo=[ ,\t,\r,\n]+
%{
    private Symbol symbol(int type, Object value){
        return new Symbol(type, yyline, yycolumn, value);
    }
    private Symbol symbol(int type){
        return new Symbol(type, yyline, yycolumn);
    }
%}
%%

/* Salto de linea */
( "\n" ) {return new Symbol(sym.SaltoLinea, yychar, yyline, yytext());}

/* Llave de apertura */
( "{" ) {return new Symbol(sym.LlaveA, yychar, yyline, yytext());}


/* Llave de cierre */
( "}" ) {return new Symbol(sym.LlaveC, yychar, yyline, yytext());}

/* Dospuntos */
( ":" ) {return new Symbol(sym.DosP, yychar, yyline, yytext());}

/* Operador Negativo */
( "-" ) {return new Symbol(sym.Negativo, yychar, yyline, yytext());}

/* Coma */
( "," ) {return new Symbol(sym.Coma, yychar, yyline, yytext());}

/* Corchete de apertura */
( "[" ) {return new Symbol(sym.CorcheteA, yychar, yyline, yytext());}

/* Corchete de cierre */
( "]" ) {return new Symbol(sym.CorcheteC, yychar, yyline, yytext());}

/* Comillas Dobles*/
( "\"" ) {return new Symbol(sym.ComillasD, yychar, yyline, yytext());}

/* Comillas Simples*/
( "\'" ) {return new Symbol(sym.ComillasS, yychar, yyline, yytext());}

/* Espacio*/
( " "+ ) {return new Symbol(sym.Espacio, yychar, yyline, yytext());}

/* Real */
{real} {return new Symbol(sym.Real, yychar, yyline, yytext());}

/* Real */
{espacioo} {return new Symbol(sym.Espacioo, yychar, yyline, yytext());}

/* Negativo */
"-" {numero} {return new Symbol(sym.Negativo, yychar, yyline, yytext());}

/* Alfanumerico */
{L}{numero} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

/* ID */
{L}({L}|{numero})* {return new Symbol(sym.ID, yychar, yyline, yytext());}

/* VAL */
"\"" ({numero}|{L}|{espacioo})+"\"" {return new Symbol(sym.VAL, yychar, yyline, yytext());}

/* Comentariobloque */
{C} {return new Symbol(sym.ComentarioB, yychar, yyline, yytext());}

/* Cmentariolinea */
{N} {return new Symbol(sym.ComentarioN, yychar, yyline, yytext());}

/* Numero */
{numero} {return new Symbol(sym.Numero, yychar, yyline, yytext());}



/* Alfanumerico */
{B}{espacioo}{B} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo}{B}{espacioo} {return new Symbol(sym.Alfanumerico, yychar, yyline, yytext());}

/* Error de analisis */
 . {return new Symbol(sym.Error, yychar, yyline, yytext());}

