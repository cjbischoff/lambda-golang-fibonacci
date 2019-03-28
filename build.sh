#!/bin/bash

set -o errexit -o nounset

export commitID=`git rev-parse HEAD`
export TRAVIS_REPO_OWNER=${TRAVIS_REPO_SLUG%/*}
export TRAVIS_REPO_NAME=${TRAVIS_REPO_SLUG#*/}
GOOS=linux GOARCH=amd64 go build -o main main.go
zip ${commitID()}.zip main
