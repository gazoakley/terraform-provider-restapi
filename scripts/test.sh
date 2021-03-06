#!/bin/bash

cd $(dirname $0)

export GOOS=""
export GOARCH=""
export GOPATH="$HOME/go"

echo "Synchronizing dependencies..."
cd ../
govendor sync

cd restapi

echo "Running tests..."
if ! go test;then
  echo "Failed testing. Aborting."
  exit 1
fi
