FROM sameersbn/gitlab-ci-multi-runner:0.6.2
MAINTAINER Michał "rysiek" Woźniak <rysiek@occrp.org>

#
# a Gitlab CI container to be used with Jekyll static site generator
#

# environment
ENV DEBIAN_FRONTEND=noninteractive 

# Ruby and requirements
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        software-properties-common \
        make \
        gcc \
        libc-dev-bin \
        libc6-dev \
        linux-libc-dev \
        libc6 \
        ruby2.0 \
        ruby2.0-dev \
        nodejs && \
    rm -rf /var/lib/apt/lists/*
    
# Jekyll
RUN gem2.0 install jekyll bundle

VOLUME /output