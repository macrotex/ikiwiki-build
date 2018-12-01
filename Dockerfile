FROM debian:stretch-slim
MAINTAINER  maintainer dockerhub216@macrotex.net

RUN apt-get update
RUN apt-get install -y ikiwiki

RUN useradd -ms /bin/bash ikiwiki
WORKDIR /home/ikiwiki

ADD ikiwki-gen.sh /root/ikiwiki-gen.sh

# Run it.
CMD ["/root/ikiwiki-gen.sh"]
