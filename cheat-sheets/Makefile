


default: distclean build-html build-latex

build-html:
	./build.sh --pan-output html --extension html

build-latex:
	./build.sh
	cd build-template-latex/; ./build.sh;

distclean: 
	$(RM) *.pdf
	$(RM) -r bin
