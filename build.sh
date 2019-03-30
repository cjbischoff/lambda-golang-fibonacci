#!/bin/bash

set -o errexit -o nounset

export commitID=`git rev-parse HEAD`
echo $commitID
export TRAVIS_REPO_OWNER=${TRAVIS_REPO_SLUG%/*}
export TRAVIS_REPO_NAME=${TRAVIS_REPO_SLUG#*/}
echo $TRAVIS_REPO_NAME
GOOS=linux GOARCH=amd64 go build -o main lambda_golang_fibonacci.go
zip ${commitID}.zip main
