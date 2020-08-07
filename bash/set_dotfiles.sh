#!/bin/bash

echo "Setting ~/.bashrc and ~/.bash-git-prompt"
cat .devcontainer/.bashrc >> /root/.bashrc

if [ ! -d "~/.bash-git-prompt" ]
    then
        git clone https://github.com/magicmonty/bash-git-prompt.git ~/.bash-git-prompt
fi