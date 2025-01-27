vpath %.yaml .:_spec

plano.pdf : plano.md article.yaml bibliografia.yaml
	pandoc -o $@ -d _spec/article.yaml $<
# vim: set foldmethod=marker shiftwidth=2 tabstop=2 :
