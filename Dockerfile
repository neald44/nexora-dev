FROM kasmweb/debian-bookworm-desktop:1.17.0

USER root

RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER 1000
