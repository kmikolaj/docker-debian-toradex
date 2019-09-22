#!/bin/sh

set -x

cd $(dirname $0)

docker build --no-cache --rm -t kmikolaj/build-toradex:stretch .

exit $?
