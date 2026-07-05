#!/bin/bash
set -e

echo "Nexora Dev Workspace v0.3.0"
echo "Node: $(node -v)"
echo "Python: $(python3 --version)"

cd /workspace
exec bash
