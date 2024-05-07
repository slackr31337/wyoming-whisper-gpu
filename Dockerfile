FROM nvidia/cuda:12.3.2-base-ubuntu22.04

# Install Whisper
WORKDIR /usr/src
ARG WHISPER_VERSION='2.0.0'

RUN \
    apt-get update \
    && apt-get install -y --no-install-recommends \
        build-essential \
        python3 \
        python3-dev \
        python3-pip \
        nvidia-cuda-toolkit

RUN \
    pip3 install --no-cache-dir -U \
        setuptools \
        wheel \
    && pip3 install --no-cache-dir torch \
    && pip3 install --no-cache-dir \
        "wyoming-faster-whisper==${WHISPER_VERSION}"

RUN \
    apt-get purge -y --auto-remove \
        build-essential \
        python3-dev \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /
COPY run.sh ./

EXPOSE 10300

ENTRYPOINT ["bash", "/run.sh"]
