# {{{1 Variables
#      =========
vpath %.yaml .:_data:_spec
SRC    = $(wildcard src/*.md)
SLIDES  = $(patsubst src/%.md,slides-%/index.html,$(SRC))

# {{{1 Recipes
#      =======
.PHONY : slides
slides : $(SLIDES)

plano.pdf : src/plano.md book.yaml biblio.yaml
	pandoc -o $@ -d _spec/book.yaml $<

slides-%/index.html : docs/%.md \
	_data/revealjs.yaml \
	_data/revealjs-crossref.yaml \
	_data/biblio.yaml \
	_data/modern-language-association.csl
	@-mkdir -p $(@D)
	@pandoc -o $@ -d _data/revealjs.yaml $<
	@echo $(@D)
# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
