#!/bin/bash

set -o errexit -o nounset
go get -u golang.org/x/lint/golint
go get -t ./...
golint -set_exit_status
go vet .
go test .
go test ./... -race -coverprofile=coverage.txt -covermode=atomic
$GOPATH/bin/goveralls -service=travis-ci
