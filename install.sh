#!/bin/bash
mkdir -p ~/Projects/bitbucket/
mkdir -p ~/Projects/github/
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install git
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Projects/github/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
pip install virtualenvwrapper
pip install neovim
pip3 install neovim
brew install nvim
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
brew install tmux
brew install zsh
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)
cd ~ && curl -L git.io/antigen > antigen.zsh
brew install fzf ctags ag fd coreutils httpie jq awscli kubectl kubectx
cd ~/Projects/github/dotfiles && ./bin/symlink-dotfiles
