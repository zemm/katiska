
all: hugo

hugo:
	hugo

push:
	git push origin master
	git subtree push --prefix=public git@github.com:zemm/katiska gh-pages

.PHONY: hugo
.PHONY: push
