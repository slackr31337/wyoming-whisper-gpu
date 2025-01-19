##########################################
FROM nvidia/cuda:12.3.2-base-ubuntu22.04

ARG WHISPER_VERSION='2.4.0'

ENV LANG=C.UTF-8
ENV DEBIAN_FRONTEND=noninteractive
ENV LD_LIBRARY_PATH=/app/lib:$LD_LIBRARY_PATH

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
    /app/bin/python3 -m pip install --no-cache-dir \
        --extra-index-url https://www.piwheels.org/simple \
        "wyoming-faster-whisper @ https://github.com/rhasspy/wyoming-faster-whisper/archive/refs/tags/v${WHISPER_VERSION}.tar.gz" &&\
    \
    cp /app/lib/python3.10/site-packages/nvidia/cudnn/lib/lib*.so.* /app/lib/ &&\
    \
    apt-get purge -y --auto-remove \
        build-essential \
        python3-dev &&\
    \
    apt clean && rm -rf /root/.cache/* /var/lib/apt/lists/*

COPY run.sh .

EXPOSE 10300

ENTRYPOINT ["bash", "/app/run.sh"]
