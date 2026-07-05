#!/bin/bash
set -e

echo "Installing core packages..."

apt-get update

apt-get install -y \
    git \
    curl \
    wget \
    jq \
    unzip \
    zip \
    tree \
    htop \
    btop \
    ncdu \
    ripgrep \
    fd-find \
    bat \
    fzf \
    less \
    vim \
    nano \
    tmux \
    build-essential \
    ca-certificates \
    gnupg \
    lsb-release \
    software-properties-common \
    python3 \
    python3-pip \
    python3-venv

apt-get clean
rm -rf /var/lib/apt/lists/*
