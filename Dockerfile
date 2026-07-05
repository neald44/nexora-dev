ARG KASM_VERSION=1.19.0
FROM kasmweb/debian-bookworm-desktop:${KASM_VERSION}

ARG DEBIAN_FRONTEND=noninteractive

USER root

# -----------------------------------------------------------------------------
# Image Metadata
# -----------------------------------------------------------------------------
LABEL maintainer="Derrick Neal"
LABEL org.opencontainers.image.title="Nexora Dev Workspace"
LABEL org.opencontainers.image.description="Custom Kasm development environment"
LABEL org.opencontainers.image.version="0.8.0"

# -----------------------------------------------------------------------------
# Core Linux Packages
# -----------------------------------------------------------------------------
COPY docker/install-packages.sh /tmp/install-packages.sh

RUN chmod +x /tmp/install-packages.sh && \
    /tmp/install-packages.sh && \
    rm /tmp/install-packages.sh

# -----------------------------------------------------------------------------
# Developer Toolchain
# -----------------------------------------------------------------------------

COPY docker/install-node.sh /tmp/install-node.sh
COPY docker/install-code-server.sh /tmp/install-code-server.sh

RUN chmod +x \
    /tmp/install-node.sh \
    /tmp/install-code-server.sh && \
    /tmp/install-node.sh && \
    /tmp/install-code-server.sh && \
    rm \
    /tmp/install-node.sh \
    /tmp/install-code-server.sh

# -----------------------------------------------------------------------------
# VS Code Server
# -----------------------------------------------------------------------------
RUN curl -fsSL https://code-server.dev/install.sh | sh

# -----------------------------------------------------------------------------
# Developer Configuration
# -----------------------------------------------------------------------------
COPY docker/configure-git.sh /tmp/configure-git.sh
COPY docker/configure-shell.sh /tmp/configure-shell.sh

RUN chmod +x /tmp/configure-git.sh /tmp/configure-shell.sh && \
    /tmp/configure-git.sh && \
    /tmp/configure-shell.sh && \
    rm /tmp/configure-git.sh /tmp/configure-shell.sh

# -----------------------------------------------------------------------------
# Workspace Layout
# -----------------------------------------------------------------------------
COPY docker/create-workspace.sh /tmp/

RUN chmod +x /tmp/create-workspace.sh && \
    /tmp/create-workspace.sh && \
    rm /tmp/create-workspace.sh

# -----------------------------------------------------------------------------
# Runtime Configuration
# -----------------------------------------------------------------------------
WORKDIR /workspace

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3001 8080

#USER 1000

#ENTRYPOINT ["/entrypoint.sh"]
