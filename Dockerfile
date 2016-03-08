FROM sameersbn/gitlab-ci-multi-runner:0.6.2
MAINTAINER Michał "rysiek" Woźniak <rysiek@occrp.org>

#
# a Gitlab CI container to be used with Jekyll static site generator
#

# environment
ENV DEBIAN_FRONTEND=noninteractive 
ENV HUGO_VERSION=0.15

# Ruby
RUN DEBIAN_FRONTEND=noninteractive apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        ruby \
        ruby-dev \
        make \
        gcc \
        nodejs && \
    rm -rf /var/lib/apt/lists/*
    
# Jekyll
RUN gem install jekyll bundle

VOLUME /output