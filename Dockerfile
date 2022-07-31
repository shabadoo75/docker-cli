FROM ubuntu:focal

# set any environment variables
ENV DEBIAN_FRONTEND=noninteractive

ARG ubuntu_version=focal

# update
RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install \
ca-certificates \
curl \
wget \
gnupg \
python3-pip \
python-is-python3 \
software-properties-common \
keychain \
bc \
git \
jq \
zip \
direnv \
vim && \
apt-get clean && rm -rf /var/lib/apt/lists/*

RUN pip3 install \
boto3 \
pyyaml \
pytz \
awscli \
aws-sam-cli \
dateparser \
pyjwt \
requests \
zabbix-api

# command
ENTRYPOINT [ "/bin/bash", "-l" ]
