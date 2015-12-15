FROM sameersbn/gitlab-ci-multi-runner:0.6.2
MAINTAINER Michał "rysiek" Woźniak <rysiek@occrp.org>

#
# a Gitlab CI container to be used with Hugo static site generator
# 
# inspired by:
# https://github.com/jojomi/docker-hugo/blob/master/Dockerfile
#

# environment
ENV DEBIAN_FRONTEND=noninteractive 
ENV HUGO_VERSION=0.15

# Hugo
RUN mkdir /tmp/hugo && \
    cd /tmp/hugo/ && \
    wget https://github.com/spf13/hugo/releases/download/v${HUGO_VERSION}/hugo_${HUGO_VERSION}_linux_amd64.tar.gz && \
    tar xzf hugo_${HUGO_VERSION}_linux_amd64.tar.gz && \
    mv hugo_${HUGO_VERSION}_linux_amd64/hugo_${HUGO_VERSION}_linux_amd64 /usr/bin/hugo && \
    rm -r hugo_${HUGO_VERSION}_linux_amd64 && \
    rm -r hugo_${HUGO_VERSION}_linux_amd64.tar.gz 

VOLUME /output