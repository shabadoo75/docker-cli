FROM ubuntu:jammy

# set any environment variables
ENV DEBIAN_FRONTEND=noninteractive

ARG ubuntu_version=jammy

# update
RUN apt-get update && apt-get -y upgrade

# install apt packages
RUN apt-get update && apt-get -y install \
ca-certificates \
curl \
wget \
gnupg \
python3-pip \
python-is-python3 \
python3-venv \
software-properties-common \
keychain \
bc \
git \
jq \
zip \
direnv \
vim && \
apt-get clean && rm -rf /var/lib/apt/lists/*

# install pip packages
RUN pip3 install \
boto3 \
pyyaml \
pytz \
awscli \
aws-sam-cli \
aws-cdk-lib \
dateparser \
pyjwt \
requests \
virtualenv \
zabbix-api

# install node
RUN curl -fsSL https://deb.nodesource.com/setup_16.x | bash -

# install node apt packages
RUN apt-get update && apt-get -y install \
nodejs

# install node packages
RUN npm install -g \
aws-cdk

# command
ENTRYPOINT [ "/bin/bash", "-l" ]
