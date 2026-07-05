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
LABEL org.opencontainers.image.version="0.5.0"

# -----------------------------------------------------------------------------
# Core Linux Packages
# -----------------------------------------------------------------------------
COPY docker/install-packages.sh /tmp/install-packages.sh

RUN chmod +x /tmp/install-packages.sh && \
    /tmp/install-packages.sh && \
    rm /tmp/install-packages.sh
# -----------------------------------------------------------------------------
# Node.js 20 LTS
# -----------------------------------------------------------------------------
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get update && \
    apt-get install -y nodejs && \
    node --version && \
    npm --version

# -----------------------------------------------------------------------------
# Global JavaScript Development Tools
# -----------------------------------------------------------------------------
RUN npm install -g \
    npm@latest \
    pnpm \
    typescript \
    nodemon

# -----------------------------------------------------------------------------
# VS Code Server
# -----------------------------------------------------------------------------
RUN curl -fsSL https://code-server.dev/install.sh | sh

# -----------------------------------------------------------------------------
# Workspace Layout
# -----------------------------------------------------------------------------
RUN mkdir -p \
    /workspace/frontend \
    /workspace/backend \
    /workspace/scripts \
    /workspace/notes

# Give the Kasm user ownership
RUN chown -R 1000:1000 /workspace

# -----------------------------------------------------------------------------
# Runtime Configuration
# -----------------------------------------------------------------------------
WORKDIR /workspace

COPY docker/entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

EXPOSE 3001 8080

USER 1000

ENTRYPOINT ["/entrypoint.sh"]
