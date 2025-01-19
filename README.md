Wyoming Whisper SST docker container with Nvidia GPU support for Home-Assistant

https://github.com/rhasspy/wyoming-faster-whisper


[![Publish Docker image](https://github.com/slackr31337/wyoming-whisper-gpu/actions/workflows/docker-image.yml/badge.svg)](https://github.com/slackr31337/wyoming-whisper-gpu/actions/workflows/docker-image.yml)


docker pull ghcr.io/slackr31337/wyoming-whisper-gpu:latest


Default model: tiny-int8

Example models:

- tiny-int8
- tiny.en
- tiny
- base-int8
- base.en
- base
- small-int8
- small.en
- small
- medium-int8
- medium.en
- medium
- large-v1
- large-v2
- large-v3
- large
- distil-large-v2
- distil-medium.en
- distil-small.en


Use environment variable to set model

Environment variables:

> MODEL=base-int8
>
> LANGUAGE=en
>


# Docker compose

```
  wyoming-whisper:  
    image: slackr31337/wyoming-whisper-gpu:latest  
    container_name: wyoming-whisper
    environment:  
      - MODEL=base-int8
    ports:  
      - 10300:10300
    volumes:  
      - /path/to/persistent/data:/data  
    restart: unless-stopped
    runtime: nvidia
    deploy:
      resources:
        reservations:
          devices:
            - driver: nvidia
              count: 1
              capabilities:
                - gpu
                - utility
                - compute

```
