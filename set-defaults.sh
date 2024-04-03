# Don't show desktop icons
defaults write com.apple.finder CreateDesktop false

# Use AirDrop over every interface. srsly this should be a default.
defaults write com.apple.NetworkBrowser BrowseAllInterfaces 1

# Always open everything in Finder's list view. This is important.
defaults write com.apple.Finder FXPreferredViewStyle Nlsv

# Show the ~/Library folder.
chflags nohidden ~/Library

# Disable press-and-hold for keys in favor of key repeat.
defaults write -g ApplePressAndHoldEnabled -bool false

# Set a really fast key repeat.
# https://github.com/mathiasbynens/dotfiles/issues/687
defaults write NSGlobalDomain KeyRepeat -int 1
defaults write NSGlobalDomain InitialKeyRepeat -int 10

# Cmd-ctrl drag anywhere in a window to move it
defaults write -g NSWindowShouldDragOnGesture -bool true

# Xcode
defaults write com.apple.dt.Xcode IDEIndexShowLog YES
# don't reopen projects on launch
defaults write com.apple.dt.Xcode ApplePersistenceIgnoreState -bool YES

# Chrome
defaults write com.google.Chrome AppleEnableSwipeNavigateWithScrolls -bool FALSE
