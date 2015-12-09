


default: build latex clean

latex:
	lualatex main.tex
	lualatex main.tex
	lualatex main.tex

build:
	./build.sh

clean:
	$(RM) *.aux
	$(RM) *.log
	$(RM) *.toc
	$(RM) *.out

distclean: clean
	$(RM) *.pdf
	$(RM) -r bin
