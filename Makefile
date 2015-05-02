
build:
	docker build -t consul-build -f Dockerfile-builder ./
	docker run consul-build > ./arm-consul-dist.tgz
	docker build -t arm-consul -f Dockerfile ./

.PHONY: build
