#!/bin/bash
set -e

echo "==========================================="
echo "Installing Node.js 20 LTS"
echo "==========================================="

# Add NodeSource repository
curl -fsSL https://deb.nodesource.com/setup_20.x | bash -

# Install Node.js
apt-get update
apt-get install -y nodejs

echo
echo "Installed versions:"
node --version
npm --version

echo
echo "Installing global JavaScript development tools..."

npm install -g \
    npm@latest \
    pnpm \
    typescript \
    nodemon

echo
echo "Global packages installed:"
npm list -g --depth=0

echo
echo "Node.js installation complete."
