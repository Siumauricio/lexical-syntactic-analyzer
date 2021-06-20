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
     expr    {printf("Respuesta: %d\n", $1); std::cout<<"Ingrese la expresion:\n";}
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

do{
  std::cout<<"----Analizador lexico y sintactico----\n";
  std::cout<<"--Calculos validos: Suma, resta, multiplicacion, division y potencia)\n";
  std::cout<<"--Presiona Ctrl + C paara finalizar\n";
  std::cout<<"Ingrese la expresion:\n";
  yyparse();
}while(true);

return 0;
  
}


void yyerror( char *s) {
  cout << "Error " << s << endl;
  exit(-1);
}
