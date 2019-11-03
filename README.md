# MacOS-initial-config
Scripts for installing MacOS applications and settings I want on any new Mac.

**Please note that this fits my tastes and/or needs. Take time to consider the consequences for you if you run this without editing it yourself.**

## **Presentation**

These scripts are successions of Shell command lines. Here are the only pre-requisites : 

- You have to be an macOS admin to use it
- You need a Mac AppStore account registered to your computer to install Apps from this platform
- Apps from the Mac AppStore shall already be linked to your account

The scripts make ues of [Homebrew](http://brew.sh "Homebrew — The missing package manager for macOS"), [Cask](https://caskroom.github.io) and [mas](https://github.com/mas-cli/mas) to install apps, and [mackup](https://github.com/lra/mackup) to restore preferences from another Mac. Plus several other ideas [borrowed here and there](https://github.com/animilimina/macOS-initial-config#inspirations).

## **How to use it**

To run the main script as is:
```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/animilimina/macOS-initial-config/master/post-install.sh)"
```

Otherwise, download the scripts you want to use and edit them. Once ready, open Terminal type "sh ", drag-n-drop the file you want to run on the Terminal window. Your command line should look like this:
```
sh [PATH]/post-install.sh
```

## **Inspirations**

My main inspiration comes from a [MacGeneration](https://www.macg.co/) [article](https://www.macg.co/logiciels/2017/01/un-script-pour-configurer-automatiquement-un-nouveau-mac-96652) and the [writer](https://github.com/nicolinuxfr)'s [repo](https://github.com/nicolinuxfr/macOS-post-installation)

His own inspiration sources were:
- Original idea: https://jeremy.hu/homebrew-cask-automate-mac-install/
- https://github.com/ryanmaclean/OSX-Post-Install-Script/
- https://github.com/snwh/osx-post-install
- https://github.com/bdougherty/dotfiles/blob/master/osx.sh
- https://github.com/joeyhoer/starter