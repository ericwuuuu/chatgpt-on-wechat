#!/bin/bash

# fetch latest release tag
CHATGPT_ON_WECHAT_TAG=`curl -sL "https://api.github.com/repos/ericwuuuuu/chatgpt-on-wechat/releases/latest" | \
     grep '"tag_name":' | \
     sed -E 's/.*"([^"]+)".*/\1/'`

# build image
docker build -f Dockerfile.debian \
             --build-arg CHATGPT_ON_WECHAT_VER=$CHATGPT_ON_WECHAT_TAG \
             -t ericwuuuuu/chatgpt-on-wechat .

# tag image
docker tag ericwuuuuu/chatgpt-on-wechat ericwuuuuu/chatgpt-on-wechat:debian
docker tag ericwuuuuu/chatgpt-on-wechat ericwuuuuu/chatgpt-on-wechat:$CHATGPT_ON_WECHAT_TAG-debian