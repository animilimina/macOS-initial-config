#!/bin/sh

### README
# Welcome! This script fits MY tastes, do not run it as is. Edit it, transform it, adapt it...
# This script is a personal rewrite of this one: https://github.com/nicolinuxfr/macOS-post-installation/blob/master/post-install.sh
# It has been created and tested on macOS 10.15.

### SETTINGS
## Disabling GateKeeper
sudo spctl --master-disable


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
brew tap homebrew/cask-versions
brew cask install java11 xquartz


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
brew install wget git node r jupyter
pip3 install jupyterlab

# postgreSQL
brew install postgresql
ln -sfv /usr/local/opt/postgresql/*.plist ~/Library/LaunchAgents
createuser -s postgres
# Run this only if you want to use psql as yourself (not recommended)
# createdb "$(id -un)"

# neo4j
brew cask install homebrew/cask-versions/adoptopenjdk8
brew install neo4j

# Dataiku DSS
mkdir -p ./Develop/Dataiku
cd ./Develop/Dataiku
wget https://raw.githubusercontent.com/animilimina/macOS-initial-config/wip/dss_version.py
DSS_VERSION=$(python3 dss_version.py)
rm dss_version.py
wget "https://cdn.downloads.dataiku.com/public/dss/$DSS_VERSION/dataiku-dss-$DSS_VERSION-osx.tar.gz"
tar xzf "dataiku-dss-$DSS_VERSION-osx.tar.gz"
rm "dataiku-dss-$DSS_VERSION-osx.tar.gz"
"dataiku-dss-$DSS_VERSION-osx/installer.sh" -d Design -p 11000
./Design/bin/dssadmin install-R-integration
cd ~

## Apps outside of the AppStore
echo 'Installing full-packaged apps.'
brew cask install atom
brew cask install visual-studio-code
brew cask install sublime-text
brew cask install rstudio
brew cask install pycharm-ce
brew cask install sourcetree
brew cask install tableau
brew cask install postman
brew cask install docker
brew cask install dbeaver-community
brew cask install onyx
brew cask install firefox
brew cask install google-chrome
brew cask install opera
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
brew cask install dropbox

## Apps from the AppStore
mas install 1333542190 # 1Password 7
mas install 918858936 # Airmail 3
mas install 1078184147 # Capto
mas install 1290358394 # Cardhop
mas install 975937182 # Fantastical 2
mas install 682658836 # GarageBand
mas install 1081413713 # GIF Brewery
mas install 668208984 # GIPHY CAPTURE
mas install 408981434 # iMovie
mas install 409183694 # Keynote
mas install 462058435 # Microsoft Excel
mas install 823766827 # Microsoft OneDrive
mas install 784801555 # Microsoft OneNote
mas install 985367838 # Microsoft Outlook
mas install 462062816 # Microsoft PowerPoint
mas install 462054704 # Microsoft Word
mas install 1116599239 # NordVPN IKE
mas install 409203825 # Numbers
mas install 409201541 # Pages
mas install 407963104 # Pixelmator
mas install 1449412482 # Reeder 4
mas install 425424353 # The Unarchiver
mas install 904280696 # Things 3
mas install 1147396723 # WhatsApp Desktop




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
defaults write com.apple.dock tilesize -int 25
# Activate magnification
defaults write com.apple.dock magnification -bool true
# Magnification size
defaults write com.apple.dock largesize -float 90
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

## Restart Dock
killall Dock



## Cherry on the top
# Oh my zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"