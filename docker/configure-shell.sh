#!/bin/bash
set -e

cat >> /etc/bash.bashrc << 'EOF'

# Nexora Dev Aliases
alias ll='ls -lah'
alias la='ls -A'
alias gs='git status'
alias gl='git lg'
alias ..='cd ..'
alias ...='cd ../..'

EOF

echo "Shell configured"
