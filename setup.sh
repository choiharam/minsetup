#!/usr/bin/bash


sudo apt update && sudo apt upgrade -y


sudo apt install git curl vim zsh -y



# oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

# zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting


# zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions


# powerlevel10k
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k


# ~/.vimrc
printf "set expandtab\nset tabstop=4\nset shiftwidth=4\nset number\nset ai\nset si\nset cindent\nset hlsearch\nset background=dark\nset nocompatible\nset nocompatible\nset bs=indent,eol,start\nset history=1000\nset ruler\nset title\nset showmatch\nset nowrap\nset wmnu\nsyntax on" > ~/.vimrc

dedent() {
    local -n reference="$1"
    reference="$(echo "$reference" | sed 's/^[[:space:]]*//')"
}

zshrc="
export ZSH="$HOME/.oh-my-zsh"

ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
"

dedent zshrc

printf "$zshrc" > ~/.zshrc

# font
wget https://github.com/romkatv/powerlevel10k-media/raw/master/MesloLGS%20NF%20Regular.ttf
open MesloLGS NF Regular.ttf;

echo "Script done!"
