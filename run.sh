#!/bin/bash

USER_ID=$(id -u)
GROUP_ID=$(id -g)

##
# run the container with $HOME mounted to /root
docker run --rm -it  \
           -v $HOME:/root \
           -w /root local-cli
           #--user $USER_ID:$GROUP_ID \
