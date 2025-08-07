# Variables
ROOT_DIR = $(HOME)/dotfiles
CONFIG_DIR = $(ROOT_DIR)/.config

os:
	@chmod +x ./scripts/os_info.sh && ./scripts/os_info.sh
	@chmod +x ./scripts/host_info.sh && ./scripts/host_info.sh

mac:
	@uname -a
	@cat /etc/os-release
	@lsb_release -a
	@hostname

linux:
	@uname -a
	@cat /etc/os-release
	@lsb_release -a
	@hostnamectl
	@df -h
	@free -h;

backup:
	@chmod +x ./scripts/backup.sh && ./scripts/backup.sh

restore:
	@chmod +x ./scripts/restore.sh && ./scripts/restore.sh

log:
	@git log

# Push dotfiles backup to Git repository
push:
	@git add $(ROOT_DIR)
	@git commit -m "Backup dotfiles on $(shell date '+%Y-%m-%d %H:%M:%S')"
	@git push origin main

# Pull latest dotfiles from Git repository
pull:
	@git pull origin main --force

# Show differences in the repository
diff:
	@git diff

# Show changes in the repository
change:
	@git status -sb

info:
	@fastfetch

# Display help information
help:
	@echo "Available targets:"
	@echo "  backup   - Backup Homebrew packages and dotfiles"
	@echo "  restore  - Restore Homebrew packages and dotfiles"
	@echo "  push     - Commit and push the dotfiles to Git repository"
	@echo "  pull     - Pull the latest dotfiles from Git repository"
	@echo "  info     - Call fastfetch show machine details information"
