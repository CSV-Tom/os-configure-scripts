

TEXFILE=main

$(TEXFILE).pdf: $(TEXFILE).tex
	latexmk -f -lualatex -pdf -quiet $(TEXFILE)

#default: clean
#	lualatex $(TEXFILE).tex
#	lualatex $(TEXFILE).tex
#	lualatex $(TEXFILE).tex

clean:
	$(RM) $(TEXFILE).aux
	$(RM) $(TEXFILE).log
	$(RM) $(TEXFILE).toc
	$(RM) $(TEXFILE).out
	$(RM) $(TEXFILE).fdb_latexmk
	$(RM) *.fls

distclean: clean
	$(RM) $(TEXFILE).pdf
	$(RM) -r bin/
