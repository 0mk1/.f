#!/bin/bash

echo -n "Install firefox, iterm, slack, zoom, chrome, spotify, spectacle, 1password"
echo -n "Install brew"
echo -n "Installing from brew"
# brew install ssh zsh tmux neovim kube-ps1 fd fzf git gnupg kubectx pinentry reattach-to-user-namespace the_silver_searcher wget curl minikube python awscli
# https://cloud.google.com/sdk/docs/quickstart-macos
# gcloud init
# gcloud auth application-default login
# gcloud container clusters get-credentials kubernetes --region europe-west1
echo -n "Install antigen"
echo "Remember to use chsh to change to /bin/zsh"
# chsh -s /bin/zsh
echo -n "Import/Create your gpg key and ssh keys"
# ssh-add id_rsa
# gpg --import --armor gpg.asc
echo -n "Create ~/code"
# mkdir ~/code
echo -n "Git clone dotfiles"
echo -n "Symlink dotfiles"
echo -n "Gitconfig"
echo -n "Enter user email:"
# read email
echo -n "Enter user gpg signingkey:"
# read signingkey
# git config --global user.email $email
# git config --global user.signingkey $signingkey
echo -n "Gpg Agent"
