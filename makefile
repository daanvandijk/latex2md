test: ./lexer/latex2mdLexer.py
	./program.py

./lexer/latex2mdLexer.py: ./latex2md.g4
	antlr4 latex2md.g4 -Dlanguage=Python3 -o lexer

clean:
	rm lexer -rf || true
