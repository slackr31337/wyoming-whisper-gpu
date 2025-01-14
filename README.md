Wyoming Whisper docker container with GPU support for Home-Assistant

https://github.com/rhasspy/wyoming-faster-whisper


[![Publish Docker image](https://github.com/slackr31337/wyoming-whisper-gpu/actions/workflows/docker-image.yml/badge.svg)](https://github.com/slackr31337/wyoming-whisper-gpu/actions/workflows/docker-image.yml)


docker pull ghcr.io/slackr31337/wyoming-whisper-gpu:latest


# Use environment variable to set model

default: tiny-int8

tiny-int8
tiny.en
tiny
base-int8
base.en
base
small-int8
small.en
small
medium-int8
medium.en
medium
large-v1
large-v2
large-v3
large
distil-large-v2
distil-medium.en
distil-small.en

> MODEL="base-int8"
>
> LANGUAGE="en"
>

