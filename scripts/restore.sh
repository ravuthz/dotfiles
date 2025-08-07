#!/bin/bash

echo " "
echo " "

# Define directories
ROOT_DIR="$HOME/dotfiles"
CONFIG_DIR="$ROOT_DIR/.config"

echo "Restoring Homebrew packages..."
# xargs brew install < "$ROOT_DIR/brew_list.txt"
brew bundle --file="$ROOT_DIR/Brewfile"

echo "Restoring dotfiles..."
echo "> Dotfile configure files..."
cp -f "$ROOT_DIR/.zshrc" "$ROOT_DIR/.zshenv" "$ROOT_DIR/.zalias" "$ROOT_DIR/.zprofile" ~/

echo "> Application configure files..."
cp -f "$CONFIG_DIR/starship.toml" ~/.config
cp -R "$CONFIG_DIR/wezterm" ~/.config
cp -R "$CONFIG_DIR/nvim" ~/.config

echo "Restore process completed!"
