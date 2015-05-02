FROM dduportal/rpi-alpine
MAINTAINER Damien DUPORTAL <damien.duportal@gmail.com>
# Part of those settings are a re-using of https://github.com/progrium/docker-consul/blob/master/Dockerfile

COPY ./arm-consul-dist.tgz /

WORKDIR /

RUN apk --update add curl bash ca-certificates \
	&& tar xzf /arm-consul-dist.tgz \
	&& mv /arm-consul-dist/consul /bin/ \
	&& chmod a+x /bin/consul \
	&& mv /arm-consul-dist/ui / \
	&& rm -rf /arm-consul-dist*


VOLUME ["/data"]
ENTRYPOINT ["/bin/consul"]
CMD ["version"]
