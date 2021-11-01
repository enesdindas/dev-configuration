#!/usr/bin/env bash

brew install nvim
brew upgrade nvim
rm -rf ~/.config/nvim
cp -r nvim ~/.config
nvim +PlugInstall +qall
echo "You can edit your Language Server Protocols from ~/.config/nvim/after/plugin/lspconfig.rc.vim."
echo "You need to install requirements of your Language Server Protocol configs."
echo "Please see https://github.com/neovim/nvim-lspconfig/blob/master/CONFIG.md for requirements of your configs"
