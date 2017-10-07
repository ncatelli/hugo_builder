ARG HUGOVERSION='0.29'
FROM bitnami/minideb:stretch

LABEL maintainer="Nate Catelli <ncatelli@packetfire.org>"
LABEL description="The hugo build environment for the packetfire site."

ARG HUGOVERSION

RUN install_packages curl rsync && \
    curl -sk "https://github.com/gohugoio/hugo/releases/download/v${HUGOVERSION}/hugo_${HUGOVERSION}_Linux-64bit.tar.gz" -L -o /tmp/hugo.tar.gz && \
    tar -zxf /tmp/hugo.tar.gz -C /tmp/ && \
    mv /tmp/hugo /usr/local/bin/hugo && \
    rm -rf /tmp/*

VOLUME /data
WORKDIR /data

ENTRYPOINT ["hugo"]
