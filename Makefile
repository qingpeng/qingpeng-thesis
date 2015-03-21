all:
	pdflatex dis
	bibtex dis
	pdflatex dis
	pdflatex dis

clean:
	rm -r dis.pdf *.bbl *.blg *.aux *.log *.lot *.lof *.toc 
