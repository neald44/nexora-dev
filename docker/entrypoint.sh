#!/bin/bash
set -e

echo "===================================="
echo " Nexora Dev Workspace"
echo "===================================="

echo "Node: $(node --version 2>/dev/null || echo missing)"
echo "NPM:  $(npm --version 2>/dev/null || echo missing)"
echo "Python: $(python3 --version 2>/dev/null || echo missing)"
echo "Git:   $(git --version 2>/dev/null || echo missing)"

echo "Workspace ready at /workspace"
echo "===================================="

exec bash
