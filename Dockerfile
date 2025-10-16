FROM ubuntu:noble

LABEL MAINTAINER="Faruk Terzioğlu <faruk.terzioglu@hotmail.com>"

ARG VERSION=30.0

ENV FILENAME=bitcoin-${VERSION}-x86_64-linux-gnu.tar.gz
ENV DOWNLOAD_URL="https://bitcoincore.org/bin/bitcoin-core-30.0/bitcoin-30.0-x86_64-linux-gnu.tar.gz"

# Some of this was unabashadly yanked from
# https://github.com/szyhf/DIDockerfiles/blob/master/bitcoin/alpine/Dockerfile

RUN apt-get update \
  && apt-get install -y wget tar bash ca-certificates \
  && wget $DOWNLOAD_URL \
  && tar xzvf /bitcoin-30.0-x86_64-linux-gnu.tar.gz \
  && mkdir /root/.bitcoin \
  && mv /bitcoin-30.0/bin/* /usr/local/bin/ \
  && rm -rf /bitcoin-30.0/ \
  && rm -rf /bitcoin-30.0-x86_64-linux-gnu.tar.gz \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

EXPOSE 18443

ADD ./docker_entrypoint.sh /usr/local/bin/docker_entrypoint.sh
ADD ./bitcoin.conf /usr/local/bin/bitcoin.conf
RUN chmod a+x /usr/local/bin/docker_entrypoint.sh

ENTRYPOINT ["/usr/local/bin/docker_entrypoint.sh"]