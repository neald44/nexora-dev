#!/bin/bash
set -e

mkdir -p \
    /workspace/frontend \
    /workspace/backend \
    /workspace/scripts \
    /workspace/shared \
    /workspace/notes

chown -R 1000:1000 /workspace
