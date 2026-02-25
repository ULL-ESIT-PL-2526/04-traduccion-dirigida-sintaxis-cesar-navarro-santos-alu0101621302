/* Lexer */
%lex
%%
\/\/.*                                              { /* skip comments */;   }
\s+                                                 { /* skip whitespace */; }
(\d*\.\d+|\d+\.)([eE][-+]?\d+)?|\d+[eE][-+]?\d+     {return 'FLOAT';         }
[0-9]+                                              { return 'NUMBER';       }
"**"                                                { return 'OP';           }
[-+*/]                                              { return 'OP';           }
<<EOF>>                                             { return 'EOF';          }
.                                                   { return 'INVALID';      }
/lex

/* Parser */
%start expressions
%token NUMBER
%%

expressions
    : expression EOF
        { return $expression; }
    ;

expression
    : expression OP term
        { $$ = operate($OP, $expression, $term); }
    | term
        { $$ = $term; }
    ;

term
    : NUMBER
        { $$ = Number(yytext); }
        | FLOAT
        { $$ = Number($1); }
    ;
%%

function operate(op, left, right) {
    switch (op) {
        case '+': return left + right;
        case '-': return left - right;
        case '*': return left * right;
        case '/': return left / right;
        case '**': return Math.pow(left, right);
    }
}
