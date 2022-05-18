#!/bin/bash

##
# run the container with $HOME mounted to /root
docker run --rm -it  -v $HOME:/root -w /root local-cli
