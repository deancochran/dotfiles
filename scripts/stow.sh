#!/usr/bin/env bash
set -e

echo "==> Symlinking dotfiles from $CONFIGS_DIR"

# Make sure we’re in the configs directory
cd "$CONFIGS_DIR" || {
    echo "❌ ERROR: Could not cd into $CONFIGS_DIR"
    exit 1
}

# Back up and stow safely
for pkg in nvim tmux; do
    echo "==> Stowing $pkg..."
    stow -v --target="$HOME" "$pkg"
done

echo "✅ Dotfiles successfully stowed!"
