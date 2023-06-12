#!/bin/bash

unset KUBECONFIG

cd .. && docker build -f docker/Dockerfile.latest \
             -t ericwuuuuu/chatgpt-on-wechat .

docker tag ericwuuuuu/chatgpt-on-wechat ericwuuuuu/chatgpt-on-wechat:$(date +%y%m%d)