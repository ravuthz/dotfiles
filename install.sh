#!/bin/bash

# Install XCode cli tools
if [[ "$(uname)" == "Darwin" ]]; then
    echo "macOS deteted..."

    if xcode-select -p &>/dev/null; then
        echo "Xcode already installed"
    else
        echo "Installing commandline tools..."
        xcode-select --install
    fi
fi

# Install homebrew
echo "Installing HomeBrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile

# Install zsh
brew install zsh
chsh -s $(which zsh)
echo $SHELL zsh --version

# Install oh-my-zsh
echo "Installing OhMyZsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# Install starship
brew install starship
echo 'eval "$(starship init zsh)"' >> ~/.zshrc
source ~/.zshrc

mkdir -p ~/.config
# starship preset tokyo-night -o ~/.config/starship.toml
curl -fsSL "https://raw.githubusercontent.com/ravuthz/starship/refs/heads/master/presets/tokyo-night.toml" -o ~/.config/starship.toml

# Install oh-my-zsh custom plugins
git clone https://github.com/agkozak/zsh-z.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-z
git clone https://github.com/zsh-users/zsh-autosuggestions.git $ZSH_CUSTOM/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
git clone https://github.com/MichaelAquilina/zsh-you-should-use.git $ZSH_CUSTOM/plugins/you-should-use

echo 'plugins=( git z zsh-autosuggestions zsh-syntax-highlighting )' >> ~/.zshrc
source ~/.zshrc


# Install nvm, node, yarn
brew install nvm
echo ' ' >> ~/.zprofile
echo '# Config NVM directory' >> ~/.zprofile
echo 'export NVM_DIR=~/.nvm' >> ~/.zprofile
echo 'source $(brew --prefix nvm)/nvm.sh' >> ~/.zprofile

nvm install node
nvm install 20 && nvm use 20 && nvm alias default 20
npm install -g yarn

echo '# Config Yarn global packages'
echo 'export PATH="$PATH:$(yarn global bin)"' >> ~/.zprofile
source ~/.zprofile

# Install postgres database
brew install postgresql@15
echo ' ' >> ~/.zprofile
echo '# Config PostgreSQL' >> ~/.zprofile
echo 'export PATH="/opt/homebrew/opt/postgresql@11/bin:$PATH"' >> ~/.zprofile
# export LDFLAGS="-L/opt/homebrew/opt/postgresql@11/lib"
# export CPPFLAGS="-I/opt/homebrew/opt/postgresql@11/include"

# Install php, composer
brew install php@8.3
brew link --overwrite --force php@8.3
echo 'export PATH="/opt/homebrew/opt/php@8.3/bin:$PATH"' >> ~/.zshrc
echo 'export PATH="/opt/homebrew/opt/php@8.3/sbin:$PATH"' >> ~/.zshrc
brew services restart php@8.3

brew install composer

# CLI tools

brew install neovim

# Back neovim configure before setup astrovim
mv ~/.cache/nvim ~/.cache/nvim.bak
mv ~/.config/nvim ~/.config/nvim.bak
mv ~/.local/share/nvim ~/.local/share/nvim.bak
mv ~/.local/state/nvim ~/.local/state/nvim.bak

# Install astrovim by clone astrovim to nvim directory
git clone --depth 1 https://github.com/AstroNvim/template ~/.config/nvim
rm -rf ~/.config/nvim/.git


brew install git bat eza make tree htop btop sqlite
brew install lazygit lazydocker curl wget httpie jq
brew install fastfetch

brew install maven openjdk
# brew install --cask zulu11
# brew uninstall zulu11


brew install --cask warp
brew install --cask wezterm
brew install --cask anydesk
brew install --cask postman
brew install --cask pgadmin4
brew install --cask localsend
brew install --cask google-chrome
brew install --cask brave-browser
brew install --cask firefox
brew install --cask visual-studio-code


# Clone ravuthz dotfiles repository
if [ ! -d "$HOME/dotfiles" ]; then
  echo "Cloning dotfiles repository..."
  git clone https://github.com/ravuthz/dotfiles.git $HOME/dotfiles
fi

echo "Done for my setup complete!"

echo "Clean up home brew"
brew cleanup -d -v