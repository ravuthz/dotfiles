# Backup Homebrew packages and dotfiles
backup:
	@echo "Backing up Homebrew packages..."
	@brew bundle dump --force --file ~/dotfiles/Brewfile
	@brew list > ~/dotfiles/brew_list.txt
	@echo "Backing up dotfiles..."
	@cp -f ~/.zshrc ~/.zalias ~/.zprofile ~/dotfiles

# Restore Homebrew packages and dotfiles
restore:
	@echo "Restoring Homebrew packages..."
	@brew bundle --file=~/dotfiles/Brewfile
	@xargs brew install < ~/dotfiles/brew_list.txt
	@echo "Restoring dotfiles..."
	@cp -f ~/dotfiles/.zshrc ~/dotfiles/.zalias ~/dotfiles/.zprofile ~/
# @xargs brew install < brew_list.txt

# Push dotfiles backup to Git repository
push:
	@git add .
	@git commit -m "Backup dotfiles on $(shell date '+%Y-%m-%d %H:%M:%S')"
	@git push origin main

# Pull latest dotfiles from Git repository
pull:
	@git pull origin main --force

diff:
	@git diff

change:
	@git status -sb

# Display help information
help:
	@echo "Available targets:"
	@echo "  backup   - Backup Homebrew packages and dotfiles"
	@echo "  restore  - Restore Homebrew packages and dotfiles"
	@echo "  push     - Commit and push the dotfiles to Git repository"
	@echo "  pull     - Pull the latest dotfiles from Git repository"
