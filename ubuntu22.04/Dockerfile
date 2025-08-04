FROM ubuntu:22.04

RUN DEBIAN_FRONTEND=noninteractive apt-get update -y && \
    apt-get install -y --no-install-recommends \
    tini \
    tzdata \
    gosu \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /workspace

ENTRYPOINT ["/usr/bin/tini", "--"]
