# These command lines remove all apps installed with brew and cask.
# They won't clean up the mess created by the removed apps, so be careful...

brew cask zap --force  $(brew cask list)
brew remove --force $(brew list)