#!/bin/bash

echo "Changing directory to ~/Projekty/github/dotfiles/"
cd ~/Projekty/github/dotfiles/

echo "Syncing..."
echo "Copying ~/.vim/UltiSnips/"
cp -R ~/.vim/UltiSnips/ .

echo "Copying ~/.aliases"
cp ~/.aliases .

echo "Copying ~/.gitconfig"
cp ~/.gitconfig .

echo "Copying ~/.gitignore_global"
cp ~/.gitignore_global .

echo "Copying ~/.tmux.conf"
cp ~/.tmux.conf .

echo "Copying ~/.ctags"
cp ~/.ctags .

echo "Copying ~/.toffi9.zsh-theme"
cp -H ~/.toffi9.zsh-theme .

echo "Copying ~/.vimrc"
cp ~/.vimrc .

echo "Copying ~/.zshrc"
cp ~/.zshrc .

echo ""
echo "Git commiting & pushing"
git add -A
git commit -m "dotfiles sync $(date +"%Y%m%d")"
git push origin master
