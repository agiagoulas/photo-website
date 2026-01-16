all: preview

build:
	hugo

preview:
	hugo server

deploy: build
	rsync -auv ./public/* photo-website:/var/www/giagoulas.com/
	echo "Deployed!"

clean:
	rm -rf public/
	rm -rf resources/
	rm -f .hugo_build.lock
	echo "Cleaned!"

.PHONY: all preview deploy clean build