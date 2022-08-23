#! /usr/bin/env bash

. $(dirname "$0")/common.sh

VERSION="v1.45.2"

if [[ $(which podman) && $(podman --version) ]]; then
  command=podman
else
  command=docker
fi

${command} run --rm -v $(pwd):/app:z -w /app -e GO111MODULE=on golangci/golangci-lint:${VERSION} \
	golangci-lint run --verbose --print-resources-usage --timeout=15m0s
