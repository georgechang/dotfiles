#! /bin/zsh

rm ~/.oh-my-zsh/custom/plugins
rm ~/.oh-my-zsh/custom/themes
$ZSH/tools/upgrade.sh
./.dotfiles/install
source ~/.zshrc