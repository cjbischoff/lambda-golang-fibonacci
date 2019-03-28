#!/bin/bash

set -o errexit -o nounset

export commitID=`git rev-parse HEAD`
export TRAVIS_REPO_OWNER=${TRAVIS_REPO_SLUG%/*}
export TRAVIS_REPO_NAME=${TRAVIS_REPO_SLUG#*/}
