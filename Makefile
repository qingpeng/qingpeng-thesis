
all: 
	pdflatex qingpeng-thesis.tex 
	bibtex qingpeng-thesis 
	pdflatex qingpeng-thesis.tex 
	pdflatex qingpeng-thesis.tex 

clean:
	rm -r qingpeng-thesis.pdf *.bbl *.blg *.aux *.log *.lot *.lof *.toc 
