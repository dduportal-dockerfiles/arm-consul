FROM dduportal/rpi-alpine
MAINTAINER Damien DUPORTAL <damien.duportal@gmail.com>

COPY ./arm-consul-dist.tgz /

# From progrium Dockerfile :

ADD https://github.com/progrium/docker-consul/raw/master/config/consul.json /config/
ONBUILD ADD ./config /config/

ADD https://github.com/progrium/docker-consul/raw/master/start /bin/start
ADD https://github.com/progrium/docker-consul/raw/master/check-http /bin/check-http
ADD https://github.com/progrium/docker-consul/raw/master/check-cmd /bin/check-cmd

RUN apk --update add curl bash ca-certificates \
	&& sed -i 's/progrium\/consul/consul/g' /bin/start \
	&& sed -i 's/progrium\/consul/consul/g' /bin/check* \
	&& tar xzf /arm-consul-dist.tgz \
	&& mv /arm-consul-dist/consul /bin/ \
	&& mv /arm-consul-dist/ui / \
	&& rm -rf /arm-consul-dist* \
	&& chmod a+x /bin/*



EXPOSE 8300 8301 8301/udp 8302 8302/udp 8400 8500 53 53/udp
VOLUME ["/data"]

ENV SHELL /bin/bash

ENTRYPOINT ["/bin/start"]
CMD []