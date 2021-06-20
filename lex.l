%{
  #include <cstdio>
  #include "grammar.tab.h" 
      void yyerror(char*);

%}
%option noyywrap
%%
[0-9]+           { yylval = atoi(yytext); return INTEGER;}
[-+^()=/*\n]        {return *yytext;}
[ \t]    ;
.       yyerror("Invalid input character");
%%
// [0-9]+\.[0-9]+  {  yylval.dvalor = atof(yytext); return FLOAT;  }


