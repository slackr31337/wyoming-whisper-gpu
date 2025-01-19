#!/usr/bin/env bash

if [ -z "${HF_HUB_CACHE}" ];then
    HF_HUB_CACHE=/tmp
fi

/app/bin/python3 -m  wyoming_faster_whisper \
    --uri 'tcp://0.0.0.0:10300' \
    --data-dir /data \
    --download-dir /data \
    --model "${MODEL:-auto}" \
    --language "${LANGUAGE:-en}" \
    --compute-type "${COMPUTE_TYPE:-int8}" \
    --beam-size "${BEAM_SIZE:-5}" \
    --device cuda \
    "$@"
