#!/bin/bash
set -e

echo "==========================================="
echo "Installing code-server"
echo "==========================================="

curl -fsSL https://code-server.dev/install.sh | sh

echo
echo "Installed version:"
code-server --version

echo
echo "code-server installation complete."
