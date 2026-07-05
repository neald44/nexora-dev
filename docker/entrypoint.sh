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

# IMPORTANT: hand control back to Kasm startup chain
exec /dockerstartup/vnc_startup.sh /dockerstartup/kasm_startup.sh "$@"
