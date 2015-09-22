TARGET=pretty-printing-in-python

all: pdf

html:
	pandoc -t slidy -s $(TARGET).txt -o $(TARGET).html

pdf:
	pandoc -t beamer $(TARGET).txt -V theme:Madrid -V colortheme:rose -o $(TARGET).pdf


clean:
	rm -f *~ $(TARGET).html $(TARGET).pdf
