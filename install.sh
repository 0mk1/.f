#!/bin/bash
mkdir -p ~/Projects/bitbucket/ &&
mkdir -p ~/Projects/github/ &&
# TODO setup mac options: capslock
# TODO chrome
# brew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
# git
brew install git
# iterm and config from dotfiles
defaults write com.googlecode.iterm2.plist PrefsCustomFolder -string "~/Projects/github/dotfiles/iterm2"
defaults write com.googlecode.iterm2.plist LoadPrefsFromCustomFolder -bool true
# virtualenvwrapper
pip install virtualenvwrapper 
# vim8 with flags
pip install neovim
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
# install utils
brew install fzf ctags ag fd coreutils httpie jq awscli kubectl kubectx
# TODO docker, docker-compose
# symlink dotfiles
cd ~/Projects/github/dotfiles && ./bin/symlink-dotfiles
