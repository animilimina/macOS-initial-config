#!/bin/sh

### README
# Welcome! This script fits MY tastes, do not run it as is. Edit it, transform it, adapt it...
# This script is a personal rewrite of this one: https://github.com/nicolinuxfr/macOS-post-installation/blob/master/post-install.sh
# It has been created and tested on macOS 10.15.

### Install utilities
## Homebrew - Package management

# Requirements (https://docs.brew.sh/Installation#macos-requirements)
if test ! $(which xcode-select)
then
    echo 'Installing Command Line Tools for Xcode'
    xcode-select --install
fi

# Homebrew itself
if test ! $(which brew)
then
    echo 'Installing Homebrew'
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Updating homebrew library
# sudo chown -R $(whoami) $(brew --prefix)/*
brew update

## mas - Apps from the Mac AppStore
brew install mas

## Cask - Other apps
brew tap caskroom/cask

## Optional dependancies (safer to install them)
brew cask install java xquartz

### Installing software

## Packages
# Python
echo 'Installin Python'
brew install pyenv
pyenv install 2.7.16
pyenv install 3.6.9
pyenv install 3.7.4
Pyenv install 3.8.0
pyenv global 3.8.0

echo 'Installing other command-line packages'
brew install wget git node postgresql r jupyter jupyterlab

## Apps outside of the AppStore
echo 'Installing full-packaged apps.'
brew cask install atom
brew cask install visual-studio-code
brew cask install sublime-text
brew cask install rstudio
brew cask install pycharm-ce
brew cask install sourcetree
brew cask install postman
brew cask install docker
brew cask install dbeaver-community
brew cask install onyx
brew cask install firefox
brew cask install google-chrome
brew cask install alfred
brew cask install bartender
brew cask install scroll-reverser
brew cask install pock
brew cask install calibre
brew cask install spamsieve
brew cask install keybase
brew cask install transmission
brew cask install transmit
brew cask install cyberduck
brew cask install ledger-live
brew cask install sia-ui
brew cask install vlc
brew cask install hazel
brew cask install hyperdock

## Apps from the AppStore
mas install 1333542190 918858936 1078184147 1290358394 975937182 682658836 1081413713 668208984 408981434 409183694 1116599239 409203825 409201541 407963104 1449412482 425424353 904280696 1147396723
# 1333542190 - 1Password 7
# 918858936 - Airmail 3
# 1078184147 - Capto
# 1290358394 - Cardhop
# 975937182 - Fantastical 2
# 682658836 - GarageBand
# 1081413713 - GIF Brewery
# 668208984 - GIPHY CAPTURE
# 408981434 - iMovie
# 409183694 - Keynote
# 1116599239 - NordVPN IKE
# 409203825 - Numbers
# 409201541 - Pages
# 407963104  - Pixelmator
# 1449412482 - Reeder 4
# 425424353 - The Unarchiver
# 904280696 - Things 3
# 1147396723 - WhatsApp Desktop




### Configuration

## Finder
# Search in active folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

## Dock
# Show hidden apps
defaults write com.apple.dock showhidden -bool TRUE
# Auto-hide
defaults write com.apple.dock autohide -bool TRUE
# Size
defaults write com.apple.dock tilesize -int 20
# Activate magnification
defaults write com.apple.dock magnification -bool true
# Magnification size
defaults write com.apple.dock largesize -float 70
# Dock on the left
defaults write com.apple.Dock orientation -string left 
# Minimize to application
defaults write com.apple.dock minimize-to-application -bool TRUE
# Minimize scale animation
defaults write com.apple.dock mineffect -string scale

## Launchpad layout
# Number of columns
defaults write com.apple.dock springboard-columns -int 8
# Number of rows
defaults write com.apple.dock springboard-rows -int 8

# Be able to select text in quick view
defaults write com.apple.finder QLEnableTextSelection -bool true



# Restart Dock
killall Dock



## Cherry on the top
# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"