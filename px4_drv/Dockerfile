FROM alpine:3

RUN apk add --update-cache --no-cache curl git make gcc musl-dev unzip

VOLUME /lib/firmware
VOLUME /usr/src/px4_drv-0.2.1

COPY ./build.sh /
CMD ./build.sh
