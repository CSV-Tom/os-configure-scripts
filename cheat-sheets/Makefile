


default: distclean build-html build-latex clean

build-html:
	./build.sh --pan-output html --extension html

build-latex:
	./build.sh
#	lualatex main.tex
#	lualatex main.tex
#	lualatex main.tex


clean:
#	$(RM) *.aux
#	$(RM) *.log
#	$(RM) *.toc
#	$(RM) *.out

distclean: clean
	$(RM) *.pdf
	$(RM) -r bin
