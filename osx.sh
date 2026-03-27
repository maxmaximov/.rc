#!/usr/bin/env bash

set -euo pipefail

# `defaults` reads and writes macOS preference domains and plist-backed app settings.
# `pmset` reads and writes power management settings such as sleep and hibernation.
# `systemsetup` changes machine-level system settings such as the time zone.
# `scutil` reads and writes system identity settings such as computer and host names.
# `dscl` reads and writes user account attributes such as the profile picture path.

###############################################################################
# Computer Identity                                                           #
###############################################################################

# Set the human-readable computer name.
sudo scutil --set ComputerName "maxmaximov"

# Set the Bonjour/local network hostname.
sudo scutil --set LocalHostName "maxmaximov"

# Set the Unix hostname explicitly.
sudo scutil --set HostName "maxmaximov"

# Set the SMB/NetBIOS name.
sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string "maxmaximov"

# Set the full name of the current user.
sudo dscl . -create "/Users/$(id -un)" RealName "Max Maximov"

# Set the login shell of the current user.
sudo dscl . -create "/Users/$(id -un)" UserShell "/bin/zsh"

# Refresh the local avatar from Gravatar.
GRAVATAR_HASH="$(md5 -qs 'max.maximov@gmail.com')"
curl -fsSL "https://www.gravatar.com/avatar/${GRAVATAR_HASH}?s=512&d=404" -o "${HOME}/.dotfiles/avatar.jpeg"

if [[ -f "${HOME}/.dotfiles/avatar.jpeg" ]]; then
  # Drop any embedded avatar blob so the file-based picture path wins.
  sudo dscl . -delete "/Users/$(id -un)" JPEGPhoto 2>/dev/null || true

  # Set the user profile picture.
  sudo dscl . -create "/Users/$(id -un)" Picture "${HOME}/.dotfiles/avatar.jpeg"
fi

###############################################################################
# Language, Locale, And UI                                                    #
###############################################################################

# Prefer English first and Russian second, both with Netherlands regional variants.
defaults write NSGlobalDomain AppleLanguages -array "en-NL" "ru-NL"

# Use the en_NL locale.
defaults write NSGlobalDomain AppleLocale -string "en_NL"

# Allow switching between Latin and non-Latin input sources with Caps Lock.
defaults write com.apple.HIToolbox AppleCapsLockPressAndHoldToggleOff -int 0

# Enable tap-to-click on the trackpad.
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true

# Show all filename extensions.
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Save screenshots to Downloads.
defaults write com.apple.screencapture location -string "${HOME}/Downloads"

# Use window capture mode in the Screenshot UI.
defaults write com.apple.screencapture style -string "window"

# Allow quitting Finder with Cmd+Q.
defaults write com.apple.finder QuitMenuItem -bool true

# Show hidden files in Finder.
defaults write com.apple.finder AppleShowAllFiles -bool true

# Show the Finder status bar.
defaults write com.apple.finder ShowStatusBar -bool true

# Show the Finder path bar.
defaults write com.apple.finder ShowPathBar -bool true

# Show the full POSIX path in Finder window titles.
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Use icon view as the preferred Finder view.
defaults write com.apple.finder FXPreferredViewStyle -string "icnv"

# Enable iCloud Drive integration in Finder.
defaults write com.apple.finder FXICloudDriveEnabled -bool true

# Store Desktop in iCloud Drive.
defaults write com.apple.finder FXICloudDriveDesktop -bool true

# Store Documents in iCloud Drive.
defaults write com.apple.finder FXICloudDriveDocuments -bool true

# Avoid creating .DS_Store files on network volumes.
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true

# Set Dock icon size to 100 pixels.
defaults write com.apple.dock tilesize -int 100

# Rebuild Dock contents to the preferred app order.
if command -v dockutil >/dev/null 2>&1; then
  dockutil --no-restart --remove all
  dockutil --no-restart --add "/Applications/Google Chrome.app"
  dockutil --no-restart --add "/Applications/Telegram.app"
  dockutil --no-restart --add "/Applications/Slack.app"
  dockutil --no-restart --add "/System/Applications/Mail.app"
  dockutil --no-restart --add "/System/Applications/Calendar.app"
  dockutil --no-restart --add "/System/Applications/Reminders.app"
  dockutil --no-restart --add "/System/Applications/Notes.app"
  dockutil --no-restart --add "/Applications/Ghostty.app"
  dockutil --no-restart --add "${HOME}/Downloads" --section others --view fan --display folder --sort dateadded
fi

# Use the Europe/Amsterdam time zone.
sudo systemsetup -settimezone "Europe/Amsterdam"

# Store iTerm2 preferences in ~/.config/iterm2.
defaults write com.googlecode.iterm2 PrefsCustomFolder -string "${HOME}/.config/iterm2"

# Load iTerm2 preferences from the custom folder.
defaults write com.googlecode.iterm2 LoadPrefsFromCustomFolder -bool true

# Restart affected apps and services so the updated settings are picked up immediately.
killall Finder Dock SystemUIServer 2>/dev/null || true
