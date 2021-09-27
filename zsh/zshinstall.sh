#!/bin/bash

# install oh-my-zsh
curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh | bash -
# apply zshrc
cp $(pwd)/.zshrc ~/.zshrc
cp $(pwd)/.profile ~/.profile

### PLUGINS
#p10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ~/.oh-my-zsh/custom/themes/powerlevel10k
#syntax highlight
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ~/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting 
# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install
# autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions
#zsh-z 
git clone https://github.com/agkozak/zsh-z ~/.oh-my-zsh/custom/plugins/zsh-z


### apply theme
git clone https://github.com/pentago/dzhi-zsh-theme.git 
cp dzhi.zsh-theme ~/.oh-my-zsh/themes
rm -rf dzhi-zsh-theme

chsh $(which zsh)

zsh

p10k configure