SHELL := /bin/bash
BIB_PROG := bibtex

# export TEXINPUTS := ~/texmf/achemso:$TEXINPUTS

SOURCES = Makefile *.tex references.bib chapters/*.tex figures/*
TEXNAME = main

all: $(TEXNAME).pdf
$(TEXNAME).pdf: $(TEXNAME).tex $(SOURCES)
	pdflatex $(TEXNAME)
	-$(BIB_PROG) $(TEXNAME)
	pdflatex $(TEXNAME)
	pdflatex $(TEXNAME)
clean:
	rm -f *.aux
	rm -f *.out
	rm -f *.log
	rm -f main.pdf
