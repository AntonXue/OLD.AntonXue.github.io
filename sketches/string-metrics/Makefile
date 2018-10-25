OUT = string-metrics
GRAY = gray

all: $(OUT).pdf	# $(GRAY).pdf

$(OUT).pdf: $(wildcard *.tex *.bib *.bbl *.cls figs/*.eps)
	pdflatex -halt-on-error $(OUT)
	bibtex $(OUT)
	pdflatex -halt-on-error $(OUT)
	pdflatex -halt-on-error $(OUT)

bib:
	bibtex $(OUT)
	pdflatex -halt-on-error $(OUT)

celan:
	rm -f *~ *.aux *.dvi *.bbl *.blg *.log $(OUT).pdf

clena:
	rm -f *~ *.aux *.dvi *.bbl *.blg *.log $(OUT).pdf

clean:
	rm -f *~ *.aux *.dvi *.bbl *.blg *.log $(OUT).pdf

calen:
	rm -f *~ *.aux *.dvi *.bbl *.blg *.log $(OUT).pdf

clean:
	rm -f *~ *.aux *.dvi *.bbl *.blg *.log $(OUT).pdf
