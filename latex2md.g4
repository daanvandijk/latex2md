grammar latex2md;

document : element+ ;

element 
  : Content
  | Part
  | Math
  | Block
  ;


/* 
 * Below are the lexer rules.
 * Lexer rules should start with capital letters,
 * and they allow for character ranges, e.g. [a-z].
 */

Name : [a-zA-Z0-9]+ ;

Content
  : (~('\\' | '$') | '\\item')+
  ;

Math
  : '$' (~('$'))+ '$'
  | '$$' (~('$'))+ '$$'
  | '\\begin{equation*}' .*? '\\end{equation*}'
  | '\\begin{equation}' .*? '\\end{equation}'
  | '\\begin{align*}' .*? '\\end{align*}'
  | '\\begin{align}' .*? '\\end{align}'
  ;

Block
  : '\\begin{' Name '}' Content '\\end{' Name '}' 
  | '\\begin{' Name '*}' Content '\\end{' Name '*}' 
  ;

BracedContent
  : '{' (~('\\' | '{' | '}'))* '}'
  ;

Part
  : '\\' Name BracedContent 
  ;

WS : [ \t\r\n]+ -> skip ;
