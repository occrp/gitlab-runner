FROM sameersbn/gitlab-ci-multi-runner:1.1.4-7
MAINTAINER Michał "rysiek" Woźniak <rysiek@occrp.org>

#
# a Gitlab CI container with ability to install additional packages at buildtime
#

# environment
ENV DEBIAN_FRONTEND=noninteractive

# just in case some tool needs UTF-8 support
ENV LANG en_US.UTF-8
ENV LANGUAGE en_US:en
ENV LC_ALL en_US.UTF-8
RUN locale-gen en_US.UTF-8

# adding repository keys
ARG ADD_REPOSITORY_KEYS=
RUN if [ "$ADD_REPOSITORY_KEYS" != "" ]; then \
        DEBIAN_FRONTEND=noninteractive apt-get -q update && \
        apt-get -q -y --no-install-recommends install \
            gpg \
            apt-transport-https \
            ca-certificates \
            lsb-release && \
        apt-get -q clean && \
        apt-get -q -y autoremove && \
        rm -rf /var/lib/apt/lists/* && \
        echo "$ADD_REPOSITORY_KEYS" | sed -e 's/^[[:space:]]*//' | apt-key add - ; \
    fi
    
# adding repositories
ARG ADD_REPOSITORIES=
RUN if [ "$ADD_REPOSITORIES" != "" ]; then \
        echo "$ADD_REPOSITORIES" | sed -e 's/^[[:space:]]*//' > /etc/apt/sources.list.d/added-from-docker-build-arg.list ; \
    fi

# we might need to install some packages, but doing this in the entrypoint doesn't make any sense
ARG INSTALL_PACKAGES=
RUN if [ "$INSTALL_PACKAGES" != "" ]; then \
        export DEBIAN_FRONTEND=noninteractive && apt-get update && apt-get install -y \
            $INSTALL_PACKAGES \
            --no-install-recommends && \
        rm -rf /var/lib/apt/lists/* ; \
    fi

VOLUME /output
