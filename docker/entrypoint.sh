#!/bin/bash
set -e

echo ""
echo "======================================"
echo " Nexora Dev Workspace v0.5.0"
echo "======================================"
echo ""

echo "Node:    $(node -v)"
echo "Python:  $(python3 --version)"
echo "Git:     $(git --version)"
echo ""

cd /workspace

echo "Working directory: /workspace"
echo ""
echo "To start VS Code (inside container):"
echo "  code-server --bind-addr 0.0.0.0:8080"
echo ""

exec bash
