alias ls="eza -G --icons=always --color=always --git" # ls -G
alias ll="eza -lh --icons=always --color=always --git" # ls -lh
alias la="eza -lAh --icons=always --color=always --git" # ls -lAh

# Fig pre block. Keep at the top of this file.
# [[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# ZSH_THEME="apple"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z zsh-autosuggestions zsh-syntax-highlighting)

# zsh-bat 
# zsh-z
# you-should-use

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
# source ~/powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# pnpm
export PNPM_HOME="/Users/ravuthz/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
# pnpm end

# Fig post block. Keep at the bottom of this file.
# [[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

export PATH="$PATH:/Users/ravuthz/bin"
export PATH="$PATH:/Users/ravuthz/.local/bin"
export PATH="$PATH:/Users/ravuthz/.composer/vendor/bin"

# export ANDROID_HOME="$HOME/Library/Android/sdk"

export PATH="/opt/homebrew/opt/qt@5/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@13/bin:$PATH"
# export PATH="$HOME/Applications/flutter/bin:$PATH"
# export PATH="$ANDROID_HOME/tools:$PATH"
# export PATH="$ANDROID_HOME/platform-tools:$PATH"

# bun completions
[ -s "/Users/ravuthz/.bun/_bun" ] && source "/Users/ravuthz/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH="/opt/homebrew/bin/fzf:$PATH"

# docker desktop path
export PATH="/Applications/Docker.app/Contents/Resources/bin:$PATH"

# export PGDATA='/opt/homebrew/opt/postgresql@13/bin/postgres'

# Some custom scripts
source ~/.ssh/scripts

dclear() {
  docker system prune -af &&docker builder prune -af && docker image prune -af && docker volume prune -f
}

dnone() {
  docker rmi -f $(docker images | grep "<none>" | awk "{print \$3}")
}

# The following lines have been added by Docker Desktop to enable Docker CLI completions.
fpath=(/Users/ravuthz/.docker/completions $fpath)
autoload -Uz compinit
compinit
# End of Docker CLI completions

export PATH="/opt/homebrew/opt/icu4c@76/bin:$PATH"
export PATH="/opt/homebrew/opt/icu4c@76/sbin:$PATH"

eval "$(starship init zsh)"
