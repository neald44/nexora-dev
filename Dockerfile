ARG KASM_VERSION=1.19.0
FROM kasmweb/debian-bookworm-desktop:${KASM_VERSION}

ARG DEBIAN_FRONTEND=noninteractive

USER root

# Core tooling
RUN apt-get update && apt-get install -y \
    git \
    curl \
    wget \
    jq \
    unzip \
    zip \
    build-essential \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    python3 \
    python3-pip \
    python3-venv \
 && apt-get clean && rm -rf /var/lib/apt/lists/*

# Node.js LTS (NodeSource)
RUN curl -fsSL https://deb.nodesource.com/setup_lts.x | bash - && \
    apt-get install -y nodejs

# Optional global JS tooling
RUN npm install -g npm@latest \
    && npm install -g pnpm typescript nodemon

# Workspace layout
RUN mkdir -p /workspace/frontend /workspace/backend /workspace/scripts /workspace/notes

# Permissions (Kasm user = 1000)
RUN chown -R 1000:1000 /workspace

# VS Code Server
RUN curl -fsSL https://code-server.dev/install.sh | sh

USER 1000

WORKDIR /workspace

COPY docker/entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]

EXPOSE 8080
