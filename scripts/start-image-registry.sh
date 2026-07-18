#!/bin/sh
set -o errexit

# 1. Create registry container unless it already exists
REGISTRY_NAME="${REGISTRY_NAME:-kind-registry}"
REGISTRY_PORT="${REGISTRY_PORT:-5001}"

if [ "$(docker inspect -f '{{.State.Running}}' "${REGISTRY_NAME}" 2>/dev/null || true)" != 'true' ]; then
  docker run \
    -d --restart=always -p "0.0.0.0:${REGISTRY_PORT}:5000" --network bridge --name "${REGISTRY_NAME}" \
    registry:2
fi
