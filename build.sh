#!/bin/bash

set -o errexit -o nounset

export commitID=`git rev-parse HEAD`
GOOS=linux GOARCH=amd64 go build -o main main.go
zip ${commitID()}.zip main
