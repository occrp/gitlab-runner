FROM sameersbn/gitlab-ci-multi-runner:0.6.2
MAINTAINER Michał "rysiek" Woźniak <rysiek@occrp.org>

#
# a Gitlab CI container to be used with Jekyll static site generator
#

# environment
ENV DEBIAN_FRONTEND=noninteractive 

RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ca-certificates \
        software-properties-common \
        make \
        gcc \
        nodejs && \
    rm -rf /var/lib/apt/lists/*


# Backports for new Ruby and great justice
RUN apt-add-repository ppa:brightbox/ruby-ng

# Ruby
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
        ruby2.0 \
        ruby2.0-dev && \
    rm -rf /var/lib/apt/lists/*
    
# Jekyll
RUN gem install jekyll bundle

VOLUME /output