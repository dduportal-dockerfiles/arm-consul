
build:
	docker build -t dduportal/arm-consul-build -f Dockerfile-builder ./
	docker run dduportal/arm-consul-build > ./arm-consul-dist.tgz
	docker build -t dduportal/arm-consul -f Dockerfile ./

.PHONY: build
