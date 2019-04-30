ROOT_DIR:=$(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

php-layer.zip:
	docker run --rm -v $(ROOT_DIR):/opt/layer amazonlinux:2 /opt/layer/build.sh

upload: php-layer.zip
	./upload.sh

publish: php-layer.zip
	./publish.sh

deploy: php-layer.zip
	./upload.sh
	./publish.sh

clean:
	rm php-layer.zip
