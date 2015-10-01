TARGET=pretty-printing-in-python

all: pdf

html:
	pandoc -t slidy -s $(TARGET).txt -o $(TARGET).html

latex:
	pandoc -s -t beamer -V theme:Madrid -V colortheme:rose $(TARGET).txt -o $(TARGET).tex
	sed -i '/\\begin{frame}{Pretty Print}/a \\\transfade' $(TARGET).tex
	sed -i '/@shakthimaan/i \\\definecolor{pyblue}{RGB}{51,109,157}' $(TARGET).tex
	sed -i 's/\(@shakthimaan\)/\\Huge{\\color{pyblue}{\1}}/g' $(TARGET).tex
	pdflatex $(TARGET).tex

pdf:
	pandoc -t beamer $(TARGET).txt -V theme:Madrid -V colortheme:rose -o $(TARGET).pdf


clean:
	rm -f *~ *.aux *.log *.nav *.out *.snm *.tex *.toc *.vrb $(TARGET).html $(TARGET).pdf
