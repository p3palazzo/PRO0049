vpath %.yaml .:_spec

PANDOC/LATEX := docker run -u "`id -u`:`id -g`" \
		-v "`pwd`:/data" -v "`pwd`/assets/fonts:/usr/share/fonts" \
		pandoc/latex:2.16.1

article.pdf : article.md article.yaml bibliografia.yaml
	$(PANDOC/LATEX) -o $@ -d _spec/article.yaml $<

.PHONY : clean
clean :
	rm -rf *.aux *.bbl *.bcf *.blg *.fdb_latexmk *.fls *.log *.run.xml
# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
