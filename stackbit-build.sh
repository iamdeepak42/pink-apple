#!/usr/bin/env bash

set -e
set -o pipefail
set -v

curl -s -X POST https://api.stackbit.com/project/5defd8c0d742e5001bfcec7e/webhook/build/pull > /dev/null
npx @stackbit/stackbit-pull --stackbit-pull-api-url=https://api.stackbit.com/pull/5defd8c0d742e5001bfcec7e
curl -s -X POST https://api.stackbit.com/project/5defd8c0d742e5001bfcec7e/webhook/build/ssgbuild > /dev/null
hugo
curl -s -X POST https://api.stackbit.com/project/5defd8c0d742e5001bfcec7e/webhook/build/publish > /dev/null
