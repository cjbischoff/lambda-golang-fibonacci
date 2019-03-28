#!/bin/bash

set -o errexit -o nounset

export commitID=`git rev-parse HEAD`
export TRAVIS_REPO_OWNER=${TRAVIS_REPO_SLUG%/*}
export TRAVIS_REPO_NAME=${TRAVIS_REPO_SLUG#*/}
aws lambda update-function-code --function-name ${TRAVIS_REPO_NAME} \
                --s3-bucket ${AWS_S3_BUCKET} \
                --s3-key ${commitID()}.zip \
                --region ${AWS_DEFAULT_REGION}
