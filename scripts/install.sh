#!/usr/bin/env bash
set -e

echo "==> Installing dependencies for $OS..."

case "$OS" in
    ubuntu|debian)
        sudo apt update
        sudo apt install -y stow neovim tmux curl git
        ;;
    fedora)
        sudo dnf install -y stow neovim tmux curl git
        ;;
    arch)
        sudo pacman -Sy --noconfirm stow neovim tmux curl git
        ;;
    macos)
        if ! command -v brew &>/dev/null; then
            echo "==> Installing Homebrew..."
            /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
        fi
        brew install stow neovim tmux git
        ;;
    *)
        echo "Unsupported OS: $OS. Please install dependencies manually."
        exit 1
        ;;
esac

echo "✅ Packages installed!"
