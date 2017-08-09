SHELL := /bin/bash
BIB_PROG := biber

# export TEXINPUTS := ~/texmf/achemso:$TEXINPUTS

SOURCES = Makefile *.tex references.bib
TEXNAME = main

all: $(TEXNAME).pdf
$(TEXNAME).pdf: $(TEXNAME).tex $(SOURCES)
	pdflatex $(TEXNAME)
	-$(BIB_PROG) $(TEXNAME)
	pdflatex $(TEXNAME)
	pdflatex $(TEXNAME)
clean:
	grep -vE '^(#|$$)' .gitignore | xargs rm -f
