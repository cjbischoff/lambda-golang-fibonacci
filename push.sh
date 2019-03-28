#!/bin/bash

set -o errexit -o nounset

export commitID=`git rev-parse HEAD`
export TRAVIS_REPO_OWNER=${TRAVIS_REPO_SLUG%/*}
export FUNCTION_NAME=${TRAVIS_REPO_SLUG#*/}
echo $commitID
echo $TRAVIS_REPO_SLUG
echo $FUNCTION_NAME
#aws s3 cp ${commitID()}.zip s3://${AWS_S3_BUCKET}
