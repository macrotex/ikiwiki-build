FROM debian:stretch-slim
MAINTAINER maintainer dockerhub216@macrotex.net

# Install ikiwiki.
RUN apt-get update
RUN apt-get install -y ikiwiki

# Install the AWS CLI tools.
RUN apt-get install -y python-pip
RUN pip install awscli

ADD ikiwki-build.sh /root/ikiwiki-build.sh

# Run it.
CMD ["/root/ikiwiki-build.sh"]
