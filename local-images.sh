#!/usr/bin/env bash

set -eu

for i in quay.io/jetstack/cert-manager-cainjector:v1.9.1 \
         quay.io/jetstack/cert-manager-webhook:v1.9.1 \
         quay.io/jetstack/cert-manager-controller:v1.9.1 \
         quay.io/openshift/origin-kube-rbac-proxy:latest \
         quay.io/centos/centos:stream8 \
         gcr.io/distroless/static:nonroot
do
    docker pull $i
    image=${i#*/}
    docker tag "$i" "localhost:5001/${image}"
    docker push "localhost:5001/${image}"
done

docker pull golang:1.18
docker tag golang:1.18 localhost:5001/golang:1.18
docker push localhost:5001/golang:1.18
