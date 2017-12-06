ARG HUGOVERSION='0.29'
FROM debian:9.1 

LABEL maintainer="Nate Catelli <ncatelli@packetfire.org>"
LABEL description="The hugo build environment for the packetfire site."

ARG HUGOVERSION

RUN apt-get update && \ 
    apt-get install -y curl rsync && \
    curl -sk "https://github.com/gohugoio/hugo/releases/download/v${HUGOVERSION}/hugo_${HUGOVERSION}_Linux-64bit.tar.gz" -L -o /tmp/hugo.tar.gz && \
    tar -zxf /tmp/hugo.tar.gz -C /tmp/ && \
    mv /tmp/hugo /usr/local/bin/hugo && \
    rm -rf /tmp/* && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

VOLUME /data
WORKDIR /data

CMD ["/bin/sh"]
