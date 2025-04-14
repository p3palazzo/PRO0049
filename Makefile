# {{{1 Variables
#      =========
vpath %.yaml .:_data
DOCS    = $(wildcard docs/*.md)
SLIDES  = $(patsubst docs/%.md,slides-%/index.html,$(DOCS))

# {{{1 Recipes
#      =======
.PHONY : slides
slides : $(SLIDES)

plano.pdf : docs/plano.md _spec/article.yaml _data/biblio.yaml
	pandoc -o $@ -d _spec/article.yaml --csl _data/chicago-note-bibliography.csl --bibliography _data/biblio.yaml $<

slides-%/index.html : docs/%.md \
	_data/revealjs.yaml \
	_data/revealjs-crossref.yaml \
	_data/biblio.yaml \
	_data/modern-language-association.csl
	@-mkdir -p $(@D)
	@pandoc -o $@ -d _data/revealjs.yaml $<
	@echo $(@D)
# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
