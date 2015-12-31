


default: distclean build-html build-latex

build-html:
	./build.sh --pan-output html --extension html

build-latex:
	./build.sh
	cd build-template-latex/; ./build.sh;

distclean: 
	cd build-template-latex/; make distclean;
	$(RM) -r bin
