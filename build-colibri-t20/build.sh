#!/bin/sh

set -x

cd $(dirname $0)

docker build --no-cache --rm -t kmikolaj/build-colibri-t20:V2.8 .

exit $?
