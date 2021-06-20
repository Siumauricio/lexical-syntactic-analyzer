%{
  #include <cstdio>
  #include <iostream>
  #include <math.h>  

  using namespace std;

  extern int yylex();
  extern int yyparse();
  int sym[26];
  void yyerror( char *s);
%}


%token    INTEGER VARIABLE
%left    '+' '-'
%left    '*' '/'
%left    '^'

%%

program:
    program statement '\n'
    |
    ;
    
statement:
     expr    {printf("%d\n", $1);}
     |VARIABLE  '=' expr    {sym[$1] = $3;}
;
expr: 
    INTEGER
    | expr '+' expr  {$$=$1+$3;}
    |expr '-' expr    {$$ = $1 - $3;}
    |expr '*' expr    {$$ = $1 * $3;}
    |expr '/' expr    {$$ = $1 / $3;}
    |expr '^' expr    {$$= pow ($1,$3);}
    |'('expr')'    {$$ = $2;}
    ;
%%

int main(int, char**) {

 yyparse();
return 0;
  
}
void yyerror( char *s) {
  cout << "Error" << s << endl;
  exit(-1);
}
