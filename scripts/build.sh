#!/usr/bin/env bash

docker build \
--no-cache \
--pull \
--rm \
--target riko \
--tag sfischer13/riko:latest \
.

docker image prune --force
