FROM kasmweb/debian-bookworm-desktop:1.17.0

USER root

LABEL maintainer="Derrick Neal"
LABEL org.opencontainers.image.title="Nexora Development Workspace"
LABEL org.opencontainers.image.description="Custom Kasm development environment"
LABEL org.opencontainers.image.version="0.1.0"

RUN apt-get update && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

USER 1000
