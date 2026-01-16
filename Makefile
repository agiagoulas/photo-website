all: preview

build:
	hugo

preview:
	hugo server

clean-deploy: clean build move

deploy: build move

move:
	rsync -avh --ignore-errors --progress --omit-dir-times ./public/ photo-website:/var/www/giagoulas.com/ --delete
	echo "Deployed!"

clean:
	rm -rf public/
	rm -rf resources/
	rm -f .hugo_build.lock
	echo "Cleaned!"

.PHONY: all preview deploy clean build move clean-deploy