all:
	make rebuild
	make preview

build:
	./site build

rebuild:
	./site rebuild

preview:
	chromium ./_site/index.html

recompile:
	ghc --make ./site.hs -o ./site -O3

clean:
	rm -rf _site 
	rm -rf _cache
	rm  *~
	rm  */*~

launch-site:
	rsync ./_site/* bbarros@xsounds.org:/home/bbarros/public_html -arv


upload-files:
	rsync ./files/* bbarros@xsounds.org:/home/bbarros/public_html/files -arvzP

