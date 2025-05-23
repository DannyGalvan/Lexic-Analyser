package com.translate.lexer;

import java_cup.runtime.Symbol;

%%

%class Lexer
%public
%cup
%unicode
%char
%line
%column

%{

    private Symbol symbol(int type) {
        return new Symbol(type, yyline + 1, yycolumn + 1);
    }

    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline + 1, yycolumn + 1, value);
    }

%}

%eofval{
    return symbol(ParserSym.EOF);
%eofval}

DEFINE      = "DEFINE"
PRINT       = "PRINT"
IF          = "IF"
ELSE        = "ELSE"
ELSEIF      = "ELSEIF"
THEN        = "THEN"
WHILE       = "WHILE"
DO          = "DO"
LOOP        = "LOOP"
FUNCTION    = "FUNCTION"
RETURN      = "RETURN"
END         = "END"
TRUE        = "true"
FALSE       = "false"
AND         = "AND"
OR          = "OR"
NOT         = "NOT"
ID          = [a-zA-Z_][a-zA-Z0-9_]*
NUMERO      = [0-9]+
DECIMAL     = [0-9]+"."[0-9]+
CADENA      = \"([^\"\n\r])*\"  // string entre comillas dobles
EQ          = "="
EQEQ        = "=="
NEQ         = "!="
LT          = "<"
GT          = ">"
LTE         = "<="
GTE         = ">="
PLUS        = "+"
MINUS       = "-"
MULT        = "*"
DIV         = "/"
LPAR        = "("
RPAR        = ")"
SEMICOLON   = ";"
COMMA       = ","
WHITESPACE  = [ \t\r\n]+

%%

{DEFINE}        { return symbol(ParserSym.DEFINE); }
{PRINT}         { return symbol(ParserSym.PRINT); }
{IF}            { return symbol(ParserSym.IF); }
{ELSE}          { return symbol(ParserSym.ELSE); }
{ELSEIF}        { return symbol(ParserSym.ELSEIF); }
{THEN}          { return symbol(ParserSym.THEN); }    
{WHILE}         { return symbol(ParserSym.WHILE); }
{DO}            { return symbol(ParserSym.DO); }
{LOOP}          { return symbol(ParserSym.LOOP); }
{FUNCTION}      { return symbol(ParserSym.FUNCTION); }
{RETURN}        { return symbol(ParserSym.RETURN); }
{END}           { return symbol(ParserSym.END); }
{TRUE}          { return symbol(ParserSym.TRUE, true); }
{FALSE}         { return symbol(ParserSym.FALSE, false); }
{AND}           { return symbol(ParserSym.AND); }
{OR}            { return symbol(ParserSym.OR); }
{NOT}           { return symbol(ParserSym.NOT); }
{DECIMAL}       { return symbol(ParserSym.DECIMAL, Double.parseDouble(yytext())); }
{NUMERO}        { return symbol(ParserSym.NUMERO, Integer.parseInt(yytext())); }
{CADENA}        { 
                    String texto = yytext();
                    return symbol(ParserSym.CADENA, texto.substring(1, texto.length() - 1));
                }
{ID}            { return symbol(ParserSym.ID, yytext()); }
{EQEQ}          { return symbol(ParserSym.EQEQ); }
{NEQ}           { return symbol(ParserSym.NEQ); }
{LTE}           { return symbol(ParserSym.LTE); }
{GTE}           { return symbol(ParserSym.GTE); }
{EQ}            { return symbol(ParserSym.EQ); }
{LT}            { return symbol(ParserSym.LT); }
{GT}            { return symbol(ParserSym.GT); }
{PLUS}          { return symbol(ParserSym.PLUS); }
{MINUS}         { return symbol(ParserSym.MINUS); }
{MULT}          { return symbol(ParserSym.MULT); }
{DIV}           { return symbol(ParserSym.DIV); }
{LPAR}          { return symbol(ParserSym.LPAR); }
{RPAR}          { return symbol(ParserSym.RPAR); }
{SEMICOLON}     { return symbol(ParserSym.SEMICOLON); }
{COMMA}         { return symbol(ParserSym.COMMA); }
{WHITESPACE}    { /* ignorar espacios */ }
.               { System.err.println("Carácter no reconocido: " + "en línea " + (yyline+1) + ", columna " + (yycolumn+1) + ", valor: " + yytext()); }
    