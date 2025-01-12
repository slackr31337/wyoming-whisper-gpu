##########################################
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

ARG WHISPER_VERSION='2.4.0'

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive

WORKDIR /app

RUN \
    apt-get update && apt-get upgrade -y &&\
    apt-get install -y --no-install-recommends \
        wget \
        curl \
        vim \
        git \
        python3 \
        python3-dev \
        python3-venv \
        python3-pip \
        build-essential \
        cmake \
        ca-certificates \
        pkg-config

RUN \
    python3 -m venv /app &&\
    \
    . /app/bin/activate && \
    /app/bin/python3 -m pip install --no-cache-dir -U \
        setuptools \
        wheel &&\
    \
    /app/bin/python3 -m pip install --no-cache-dir torch &&\
    \
    /app/bin/python3 -m pip install --no-cache-dir &&\
        "wyoming-faster-whisper==${WHISPER_VERSION}" &&\
    \
    apt-get purge -y --auto-remove \
        build-essential \
        python3-dev &&\
    \
    rm -rf /var/lib/apt/lists/*

COPY run.sh .

EXPOSE 10300

ENTRYPOINT ["bash", "/app/run.sh"]
