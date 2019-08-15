#!/usr/bin/env bash

docker images --quiet --filter=reference="sfischer13/riko:*" | xargs -r docker rmi --force

docker image prune --force
