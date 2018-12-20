BASENAME=nsf-2016-hw-assisted-fg-mt
FINALDIR=pdf
HTMLDIR=html_output

all: clean
	pdflatex $(BASENAME).tex
	bibtex $(BASENAME)
	pdflatex $(BASENAME).tex
	pdflatex $(BASENAME).tex

final: all
	cp ${BASENAME}.pdf $(FINALDIR)/${BASENAME}.pdf
	cp ${BASENAME}.pdf $(FINALDIR)/${BASENAME}.pdf
	cp ${BASENAME}.pdf ../${BASENAME}.pdf

clean:
	rm -rf *.log *.aux *.out *.bbl *.blg *.toc 

html:
	latex2html --dir=${HTMLDIR} --mkdir --split=0 ${BASENAME}.tex

mrproper:
	make clean
	rm -f $(BASENAME).pdf

