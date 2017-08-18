SHELL := /bin/bash
BIB_PROG := bibtex

# export TEXINPUTS := ~/texmf/achemso:$TEXINPUTS

SOURCES = Makefile *.tex references.bib chapters/*.tex figures/* ../interface-ddg-paper/figs-and-tables/* ../interface-ddg-paper/figures/* ../interface-ddg-paper/main-text.tex
TEXNAME = main

all: $(TEXNAME).pdf
$(TEXNAME).pdf: $(TEXNAME).tex $(SOURCES)
	pdflatex --shell-escape $(TEXNAME)
	-$(BIB_PROG) $(TEXNAME)
	pdflatex --shell-escape $(TEXNAME)
	pdflatex --shell-escape $(TEXNAME)
clean:
	rm -f *.aux
	rm -f *.out
	rm -f *.log
	rm -f main.pdf
