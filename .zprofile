emulate sh
source ~/.profile
emulate zsh

# Alias
source ~/.zalias

# Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zprofile.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.pre.zsh"

eval "$(/opt/homebrew/bin/brew shellenv)"

# Config NVM directory
export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

# Config Yarn global packages
export PATH="$PATH:$(yarn global bin)"

# Config Android Studio
# export ANDROID_SDK_ROOT=$HOME/Library/Android/sdk
# export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools

# Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zprofile.post.zsh" ]] && builtin source "$HOME/.fig/shell/zprofile.post.zsh"
# Added by OrbStack: command-line tools and integration
# Comment this line if you don't want it to be added again.
# Added by OrbStack: command-line tools and integration
# This won't be added again if you remove it.
source ~/.orbstack/shell/init.zsh 2>/dev/null || :
