#!/usr/bin/env bash
set -e

# =====================================================
# Dotfiles Bootstrap Script
# =====================================================

DOTFILES_DIR="${DOTFILES_DIR:-$HOME/dotfiles}"
SCRIPTS_DIR="$DOTFILES_DIR/scripts"
CONFIGS_DIR="$DOTFILES_DIR/configs"

echo "==> Bootstrapping dotfiles from $DOTFILES_DIR"

# Detect OS
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
elif [[ -f /etc/os-release ]]; then
    . /etc/os-release
    OS=$ID
else
    OS="unknown"
fi

export OS DOTFILES_DIR CONFIGS_DIR

echo "==> Detected OS: $OS"

# Run setup scripts
bash "$SCRIPTS_DIR/install.sh"
bash "$SCRIPTS_DIR/stow.sh"

echo "✅ Dotfiles setup complete!"
