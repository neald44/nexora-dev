#!/bin/bash
set -e

git config --system init.defaultBranch main
git config --system color.ui auto

git config --system alias.st status
git config --system alias.co checkout
git config --system alias.br branch
git config --system alias.sw switch
git config --system alias.ci commit
git config --system alias.lg "log --graph --oneline --decorate --all"

echo "Git configured"
