#!/usr/bin/env bash

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/app/lib/python3.10/dist-packages/nvidia/cudnn/lib/

source /app/bin/activate
/app/bin/python3 -m  wyoming_faster_whisper \
    --uri 'tcp://0.0.0.0:10300' \
    --data-dir /data \
    --download-dir /data "$@"
