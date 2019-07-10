/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.

   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     ID = 258,
     ENTRADA = 259,
     SAIDA = 260,
     INC = 261,
     ZERA = 262,
     FACA = 263,
     VEZES = 264,
     ENTAO = 265,
     SE = 266,
     ENQUANTO = 267,
     IGUAL = 268,
     FIM = 269,
     SENAO = 270,
     FIMENQUANTO = 271,
     FIMFACA = 272,
     FIMSEENTAO = 273
   };
#endif
/* Tokens.  */
#define ID 258
#define ENTRADA 259
#define SAIDA 260
#define INC 261
#define ZERA 262
#define FACA 263
#define VEZES 264
#define ENTAO 265
#define SE 266
#define ENQUANTO 267
#define IGUAL 268
#define FIM 269
#define SENAO 270
#define FIMENQUANTO 271
#define FIMFACA 272
#define FIMSEENTAO 273




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
#line 38 "provol-compiler.y"
{
    char *str;
    int number;
 }
/* Line 1529 of yacc.c.  */
#line 90 "provol-compiler.tab.h"
	YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

