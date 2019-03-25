#!/bin/bash

set -o errexit -o nounset
go get -u github.com/golang/lint/golint
go get -t ./...
golint -set_exit_status
go vet .
go test .
