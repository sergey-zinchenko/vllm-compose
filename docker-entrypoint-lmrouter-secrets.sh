#!/bin/sh
set -eu

if [ -f /run/secrets/vllm_api_key ]; then
    VLLM_API_KEY=$(cat /run/secrets/vllm_api_key)
    export VLLM_API_KEY
fi

exec /opt/venv/bin/vllm-router "$@"