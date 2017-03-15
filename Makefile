.PHONY: dev html github 
THEME=hugo-incorporated
MSG=rebuilt site

dev:
	hugo server --theme=$(THEME) --watch

html:
	rm -rf public/
	hugo --theme=$(THEME)

github: html
	git add -A
	git commit -m "${MSG}"
	git push
