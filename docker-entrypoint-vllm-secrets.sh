#!/bin/sh
set -eu

if [ -f /run/secrets/hf_token ]; then
    HUGGING_FACE_HUB_TOKEN=$(cat /run/secrets/hf_token)
    export HUGGING_FACE_HUB_TOKEN
fi

if [ -f /run/secrets/vllm_api_key ]; then
    VLLM_API_KEY=$(cat /run/secrets/vllm_api_key)
    export VLLM_API_KEY
fi

exec vllm serve "$@"