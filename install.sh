#!/bin/bash
# setup mac options: capslock
# chrome
# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# git
brew install git
# iterm and config from dotfiles

# Specify the preferences directory
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Projects/github/dotfiles/iterm2"
# Tell iTerm2 to use the custom preferences in the directory
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true

# virtualenvwrapper
pip install virtualenvwrapper neovim

# vim8 with flags
brew install vim --with-python3
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# tmux
brew install tmux reattach-to-user-namespace

# zsh
brew install zsh
sudo sh -c "echo $(which zsh) >> /etc/shells"
chsh -s $(which zsh)

# antigen
cd ~ && curl -L git.io/antigen > antigen.zsh

# symlink dotfiles
cd ~/Projects/github/dotfiles && ./bin/symlink-dotfiles

# aws-cli
# install utils
brew install fzf ctags ag fd coreutils httpie

# docker, docker-compose
