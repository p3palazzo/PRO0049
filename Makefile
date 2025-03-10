# {{{1 Variables
#      =========
vpath %.yaml .:_data
DOCS    = $(wildcard docs/*.md)
SLIDES  = $(patsubst docs/%.md,slides-%/index.html,$(DOCS))

# {{{1 Recipes
#      =======
.PHONY : local-server
local-server : $(SLIDES)

plano.pdf : plano.md article.yaml bibliografia.yaml
	pandoc -o $@ -d _spec/article.yaml $<

slides-%/index.html : docs/%.md \
	_data/revealjs.yaml \
	_data/revealjs-crossref.yaml \
	_data/biblio.yaml \
	_data/modern-language-association.csl
	@-mkdir -p $(@D)
	@pandoc -o $@ -d _data/revealjs.yaml $<
	@echo $(@D)
# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
