   /* cs152-miniL phase1 */
   
%{   
   /* write your C code here for definitions of variables and including headers */
   int currLine = 1, currPos = 1;
%}

   /* some common rules */

LETTER   [a-zA-Z]
DIGIT    [0-9]
ID       ({LETTER}({LETTER}|{DIGIT})|"_")*({LETTER}|{DIGIT})+
/* COMP     [==|<>|<|>|<=|>=] */

%%
   /* specific lexer rules in regex */

   /* RESERVED WORDS */
"function"           {printf("FUNCTION"); currPos += yyleng;}
beginparams	         {printf("BEGIN_PARAMS"); currPos += yyleng;}
endparams	         {printf("END_PARAMS"); currPos += yyleng;}
beginlocals	         {printf("BEGIN_LOCALS"); currPos += yyleng;}
endlocals         	{printf("END_LOCALS"); currPos += yyleng;}
beginbody	         {printf("BEGIN_BODY"); currPos += yyleng;}
endbody           	{printf("END_BODY"); currPos += yyleng;}
integer           	{printf("INTEGER"); currPos += yyleng;}
array	               {printf("ARRAY"); currPos += yyleng;}
enum	               {printf("ENUM"); currPos += yyleng;}        
of	                  {printf("OF"); currPos += yyleng;}
if	                  {printf("IF"); currPos += yyleng;}
then                	{printf("THEN"); currPos += yyleng;}
endif                {printf("ENDIF"); currPos += yyleng;}
for	               {printf("FOR"); currPos += yyleng;}
while               	{printf("WHILE"); currPos += yyleng;}
do	                  {printf("DO"); currPos += yyleng;}
beginloop	         {printf("BEGINLOOP"); currPos += yyleng;}
endloop	            {printf("ENDLOOP"); currPos += yyleng;}
continue	            {printf("CONTINUE"); currPos += yyleng;}
read                	{printf("READ"); currPos += yyleng;}
write                {printf("WRITE"); currPos += yyleng;}
and	               {printf("AND"); currPos += yyleng;}
or                	{printf("OR"); currPos += yyleng;}
not                	{printf("NOT"); currPos += yyleng;}
true                	{printf("TRUE"); currPos += yyleng;}
false                {printf("FALSE"); currPos += yyleng;}
return	            {printf("RETURN"); currPos += yyleng;}

         /*    ARITHMETIC OPERATORS    */
-                    {printf("MINUS"); currPos += yyleng;}
"+"                  {printf("PLUS"); currPos += yyleng;}
"*"                  {printf("MULT"); currPos += yyleng;}
"/"                  {printf("DIV"); currPos += yyleng;}
"%"                  {printf("MOD"); currPos += yyleng;}


         /*    COMPARISON OPERATORS    */
"=="                 {printf("EQ\n"); currPos += yyleng;}
"<>"	               {printf("NEQ"); currPos += yyleng;}
"<"	               {printf("LT"); currPos += yyleng;}
">"	               {printf("GT"); currPos += yyleng;}
"<="	               {printf("LTE"); currPos += yyleng;}
">="                 {printf("GTE"); currPos += yyleng;}


         /*    IDENTIFIERS AND NUMBERS    */
{ID}                 {printf("IDENT %s", yytext); currPos += yyleng;}



         /*    OTHER SPECIAL SYMBOLS    */
";"	                  {printf("SEMICOLON"); currPos += yyleng;}
":"	                  {printf("COLON"); currPos += yyleng;}
","	                  {printf("COMMA"); currPos += yyleng;}
"("	                  {printf("L_PAREN"); currPos += yyleng;}
")"	                  {printf("R_PAREN"); currPos += yyleng;}
"["	                  {printf("L_SQUARE_BRACKET"); currPos += yyleng;}
"]"	                  {printf("R_SQUARE_BRACKET"); currPos += yyleng;}
":="	                  {printf("ASSIGN"); currPos += yyleng;}


         /*    ERROR CATCHES    */
.              {printf("Error on line %d, column %d: unrecognized symbol \%s\"\n", currLine, currPos, yytext); exit(0);}
%%


	/* C functions used in lexer */

int main(int argc, char ** argv)
{
   yylex();
}
