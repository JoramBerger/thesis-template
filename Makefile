SHELL=/bin/bash

fast:
	mkdir -p run
	cp tex/*.tex bib/*.?bx run/
	cd run && pdflatex Dissertation.tex
	mv run/Dissertation.pdf Dissertation.pdf

again:
	test -e run || (mkdir run && cp tex/*.tex bib/*.?bx run/ )
	cd run && pdflatex Dissertation.tex
	mv run/Dissertation.pdf Dissertation.pdf

full:
	mkdir -p run
	cp tex/*.tex bib/*.?bx run/
	cd run && pdflatex Dissertation.tex
	cd run && biber Dissertation
	cd run && pdflatex Dissertation.tex
	cd run && pdflatex Dissertation.tex
	mv run/Dissertation.pdf Dissertation.pdf

warn:
	mkdir -p run
	cp tex/*.tex bib/*.?bx run/
	cd run && pdflatex Dissertation.tex &> /dev/null
	cd run && biber Dissertation
	cd run && pdflatex Dissertation.tex &> /dev/null
	cd run && pdflatex Dissertation.tex | grep -i warn
	mv run/Dissertation.pdf Dissertation.pdf

clean:
	rm -rf run/

purge: clean
	rm -rf *.aux
	rm -rf *.log
	rm -rf tex/*.tex~
	rm -f Makefile~

FORCE:
