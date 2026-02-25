# Syntax Directed Translation with Jison

Jison is a tool that receives as input a Syntax Directed Translation and produces as output a JavaScript parser  that executes
the semantic actions in a bottom up ortraversing of the parse tree.
 

## Compile the grammar to a parser

See file [grammar.jison](./src/grammar.jison) for the grammar specification. To compile it to a parser, run the following command in the terminal:
``` 
➜  jison git:(main) ✗ npx jison grammar.jison -o parser.js
```

## Use the parser

After compiling the grammar to a parser, you can use it in your JavaScript code. For example, you can run the following code in a Node.js environment:

```
➜  jison git:(main) ✗ node                                
Welcome to Node.js v25.6.0.
Type ".help" for more information.
> p = require("./parser.js")
{
  parser: { yy: {} },
  Parser: [Function: Parser],
  parse: [Function (anonymous)],
  main: [Function: commonjsMain]
}
> p.parse("2*3")
6
```

# Informe

## 3.1
La diferencia entre /* skip whitespace */ y devolver un token es principalmente que en el primer caso no se está devolviendo nada
ya que el patrón de los espacios en blanco es especial, no tiene tokens ni atributos, y por tanto no puede devolver un token.

## 3.2
La secuencia producida por 123**45+@ es: NUMBER, NUMBER, NUMBER, OP, NUMBER, NUMBER, OP, INVALID

## 3.3
** debe aparecer antes que [-+*/] debido a que si se quisiera utilizar el operador ** y [-+*/] estuviese declarado antes, nunca
se llegaria a utilizar **, en vez de eso se estaría reconociendo como dos signos de multiplicación OP, OP -> *, *.

## 3.4
Se devuelve EOF cuando ya no queda nada más que leer del buffer e indicar que se finalizó.

## 3.5
La regla . que devuvle invalid existe para detectar caracteres que no son reconocidos por el analizador. Si el caracter no ha cazado con
ninguna regla anterior y llega al '.', este caracter coincide con el y devuelve INVALID.