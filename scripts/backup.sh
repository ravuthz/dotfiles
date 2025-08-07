#!/bin/bash

echo ""
echo ""

# Define directories
ROOT_DIR="$HOME/dotfiles"
CODE_DIR="$ROOT_DIR/vscode"
CONFIG_DIR="$ROOT_DIR/.config"

APP_CODE_DIR="$HOME/Library/Application Support/Code/User"

# Ensure the config directory exists
if [ ! -d "$CONFIG_DIR" ]; then
    mkdir -p "$CONFIG_DIR"
fi

# Ensure the vscode directory exists
if [ ! -d "$CODE_DIR" ]; then
    mkdir -p "$CODE_DIR"
fi

echo "Backing up Homebrew packages..."
brew bundle dump --force --file "$ROOT_DIR/Brewfile"
brew list > "$ROOT_DIR/brew_list.txt"

echo "Backing up dotfiles..."

echo "> Dotfile configure files..."
cp -f ~/.zshrc ~/.zshenv ~/.zalias ~/.zprofile "$ROOT_DIR"

echo "> Application configure files..."
cp -f ~/.config/starship.toml "$CONFIG_DIR/"
cp -R ~/.config/wezterm "$CONFIG_DIR/"
cp -R ~/.config/nvim "$CONFIG_DIR/"

cp -f "$APP_CODE_DIR/settings.json" "$CODE_DIR"
cp -R "$APP_CODE_DIR/snippets" "$CODE_DIR"
