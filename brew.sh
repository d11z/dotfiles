#!/usr/bin/env bash

brew update
brew upgrade --all

brew install ack
brew install ag
brew install blackbox
brew install git
brew install htop
brew install node
brew install speedtest_cli
brew install tree
brew install vim --override-system-vi
brew install wget
brew install zsh

brew cleanup
