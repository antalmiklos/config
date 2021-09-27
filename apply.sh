#!/bin/bash

SERVER=0
ALL=0
I3INSTALL=0
CONFIGURE=0
ZSH=0
SSHKEYGENERATE=0
SKIPINSTALLS=0

function all(){
    i3
    zsh
    i3

}

function sshkey(){
    echo "lol\n"
    ssh-keygen -t rsa -f "${HOME}/.ssh/id_rsa" -P "" && cat ${HOME}/.ssh/id_rsa.pub
    return 0
}

function zsh(){
    sudo apt-get update -y && apt-get install -y \
        powerline \
        zsh
    if [[ $? -ne 0 ]]
    then
        echo "Error while installing ZSH, exiting";
        exit 1;
    fi
    $(pwd)/zsh/zshinstall.sh

function i3(){
    sudo apt-get update -y && apt-get install -y \
        i3 \
        i3-gaps \
        feh \
        nitrogen
    cp $(pwd)/i3/config ~/.config/i3/config
    cp $(pwd)/nitrogen/nitrogen.cfg ~/.config/nitrogen/nitrogen.cfg
}

while getopts "saiczsh" installopt
do
    case "${installopt}" in
        a) ALL=1;;
        i) i3;;
        c) CONFIGURE=1;;
        z) zsh;;
        s) sshkey;;
        h) echo '
        s) $SERVER=1;;
        a) $ALL=1;;
        i) $I3INSTALL=1;;
        c) $CONFIGURE=1;;
        z) $ZSH=1;;
        s) $SSHKEYGENERATE=1;;' exit 0;;
    esac
done

echo ${SSHKEYGENERATE}

if [[ $SKIPINSTALLS -eq 1 ]]
then
#install git and python3
    sudo apt-get update -y && sudo apt-get install -y python3 \
        ansible \
        git \
        vim \
        python3-dev \
        python3-pip \
        python3-setuptools \
        curl
fi

if [[ $ALL -eq 1 ]]
then
    sudo apt-get update -y && apt-get install -y \
        python3 \
        git \
        ansible \
        vim \
        python3-dev \
        python3-pip \
        python3-setuptools \
        sl \
        cowsay \
        curl \
        git
fi

if [[ $I3INSTALL -eq 1 ]]
then
    sudo apt-get update -y && apt-get install -y \
        i3 \
        i3-gaps \
        feh \
        nitrogen
fi
if [[ $ZSH -eq 1 ]]
then
    sudo add-apt-repository universe
    sudo apt-get update -y && apt-get install -y \
        powerline \
        zsh 
    $(pwd)/zsh/zshinstall.sh
fi