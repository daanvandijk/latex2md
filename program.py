#!/usr/bin/env python3
import sys
from antlr4 import *

sys.path.insert(0, './lexer')
from latex2mdLexer import latex2mdLexer
from latex2mdParser import latex2mdParser

def main(argv):
    expressions = []
    expressions.append('hello 10')
    expressions.append('Before $a^2 + b^2 = c^2$. some more text')
    expressions.append('${f \over g}$.')
    expressions.append('and some text $$ Ax = b $$ and more text')
    expressions.append('\\begin{equation}x = A^{-1} b\\end{equation}')
    expressions.append('\\section{title}')
    expressions.append('\\begin{equation}x \in y\\end{equation}')

    with open('baire.tex') as f:
        content = f.read()
        expressions.append(content)

    for s in expressions:
        stream = InputStream(s)
        lexer = latex2mdLexer(stream)
        stream = CommonTokenStream(lexer)

        parser = latex2mdParser(stream)
        # tree = parser.expression()
        tree = parser.document()
        # print(s)
        print(tree.toStringTree(recog=parser))

if __name__ == '__main__':
    main(sys.argv)
