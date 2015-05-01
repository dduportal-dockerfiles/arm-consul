FROM dduportal/rpi-alpine
MAINTAINER Damien DUPORTAL <damien.duportal@gmail.com>

COPY consul //bin/
RUN apk --update add curl bash ca-certificates

ENTRYPOINT ["/bin/consul"]
CMD ["version"]
