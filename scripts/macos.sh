#!/usr/bin/env zsh
# Configuration script for macOS (Tested on Monterey 12.3)
# Author: Yuzhou "Joe" Mo (@yuzhoumo)
# License: GNU GPLv3

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo --validate

# Keep-alive: update existing `sudo` time stamp until `macos.sh` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

printf "Configuring system settings...\n"

###############################################################################
# Privacy & Security                                                          #
###############################################################################

# Limit ad tracking
defaults write com.apple.AdLib forceLimitAdTracking -bool true
defaults write com.apple.AdLib personalizedAdsMigrated -bool false
defaults write com.apple.AdLib allowIdentifierForAdvertising -bool false
defaults write com.apple.AdLib allowApplePersonalizedAdvertising -bool false

# Disable geocode suggestions
defaults write com.apple.suggestions SuggestionsAllowGeocode -bool false

# Disable Siri suggestions
defaults write com.apple.suggestions AppCanShowSiriSuggestionsBlacklist -array \
  "com.apple.AppStore" \
  "com.apple.iCal" \
  "com.apple.AddressBook" \
  "com.apple.FaceTime" \
  "com.apple.mail" \
  "com.apple.Maps" \
  "com.apple.iChat" \
  "com.apple.MobileSMS" \
  "com.apple.news" \
  "com.apple.Notes" \
  "com.apple.Photos" \
  "com.apple.podcasts" \
  "com.apple.reminders" \
  "com.apple.Safari"

# Disable Siri analytics
defaults write com.apple.suggestions SiriCanLearnFromAppBlacklist -array \
  "com.apple.AppStore" \
  "com.apple.iCal" \
  "com.apple.AddressBook" \
  "com.apple.FaceTime" \
  "com.apple.mail" \
  "com.apple.Maps" \
  "com.apple.iChat" \
  "com.apple.MobileSMS" \
  "com.apple.news" \
  "com.apple.Notes" \
  "com.apple.Photos" \
  "com.apple.podcasts" \
  "com.apple.reminders" \
  "com.apple.Safari"

# Disable Ask Siri (System Preferences > Siri > Uncheck "Enable Ask Siri")
defaults write com.apple.assistant.support "Assistant Enabled" -bool false

# Hide Siri in menu bar
defaults write com.apple.siri StatusMenuVisible -bool false

###############################################################################
# Display & Power                                                             #
###############################################################################

# Sleep the display after 15 minutes
sudo pmset -a displaysleep 15

# Disable machine sleep while charging
sudo pmset -c sleep 0

# Set machine sleep to 20 minutes on battery
sudo pmset -b sleep 20

# Hibernation mode
# 0: Disable hibernation (speeds up entering sleep mode)
# 3: Copy RAM to disk so the system state can still be restored in case of a
#    power failure.
sudo pmset -a hibernatemode 0

###############################################################################
# Language & Input                                                            #
###############################################################################

# Enable full keyboard access for all controls
# (e.g. enable Tab in modal dialogs)
defaults write NSGlobalDomain AppleKeyboardUIMode -int 3

# Enable tap to click for this user and for the login screen
defaults write \
  com.apple.driver.AppleBluetoothMultitouch.trackpad Clicking -bool true
defaults -currentHost write NSGlobalDomain com.apple.mouse.tapBehavior -int 1
defaults write NSGlobalDomain com.apple.mouse.tapBehavior -int 1

# Enable trackpad three finger drag
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad \
  TrackpadThreeFingerDrag -bool true
defaults write com.apple.AppleMultitouchTrackpad \
  TrackpadThreeFingerDrag -bool true
defaults -currentHost write NSGlobalDomain \
  com.apple.trackpad.threeFingerDragGesture -bool true
defaults write NSGlobalDomain \
  com.apple.trackpad.threeFingerDragGesture -bool true

# Disable lookup & data detectors (three finger tap)
defaults write com.apple.AppleMultitouchTrackpad \
  TrackpadThreeFingerTapGesture -bool false
defaults write com.apple.driver.AppleBluetoothMultitouch.trackpad \
  TrackpadThreeFingerTapGesture -bool false
defaults -currentHost write NSGlobalDomain \
  com.apple.trackpad.threeFingerTapGesture -bool false
defaults write NSGlobalDomain \
  com.apple.trackpad.threeFingerTapGesture -bool false

# Disable "natural" (Lion-style) scrolling
defaults write NSGlobalDomain com.apple.swipescrolldirection -bool false

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes as they’re annoying when typing code
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable autocorrect
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable press-and-hold for keys in favor of key repeat
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false

# Set a blazingly fast keyboard repeat rate, and make it happen more quickly.
defaults write NSGlobalDomain InitialKeyRepeat -int 20
defaults write NSGlobalDomain KeyRepeat -int 1

###############################################################################
# General Tweaks                                                              #
###############################################################################

# Show battery percentage in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist \
  BatteryShowPercentage -bool true

# Show Bluetooth icon in menu bar
defaults write ~/Library/Preferences/ByHost/com.apple.controlcenter.plist \
  Bluetooth -int 2

# Jump to the spot that's clicked in scroll bar
defaults write NSGlobalDomain AppleScrollerPagingBehavior -int 1

# Expand save panel by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode2 -bool true

# Expand print panel by default
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true

###############################################################################
# Finder                                                                      #
###############################################################################

# Allow quitting Finder via ⌘ + Q; doing so will also hide desktop icons
defaults write com.apple.finder QuitMenuItem -bool true

# Don't automatically empty trash after 30 days
defaults write com.apple.finder FXRemoveOldTrashItems -bool false

# Don't show recent tags
defaults write com.apple.finder ShowRecentTags -bool false

# Disable window animations and Get Info animations
defaults write com.apple.finder DisableAllAnimations -bool true

# Set Home as the default location for new Finder windows
# For other paths, use `PfLo` and `file:///full/path/here/`
defaults write com.apple.finder NewWindowTarget -string "PfVo"
defaults write com.apple.finder NewWindowTargetPath -string "file:///"

# Show icons for hard drives, servers, and removable media on the desktop
defaults write com.apple.finder ShowExternalHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowHardDrivesOnDesktop -bool true
defaults write com.apple.finder ShowMountedServersOnDesktop -bool true
defaults write com.apple.finder ShowRemovableMediaOnDesktop -bool true

# Show all filename extensions
defaults write NSGlobalDomain AppleShowAllExtensions -bool true

# Display full POSIX path as Finder window title
defaults write com.apple.finder _FXShowPosixPathInTitle -bool true

# Keep folders on top when sorting by name
defaults write com.apple.finder _FXSortFoldersFirst -bool true

# When performing a search, search the current folder by default
defaults write com.apple.finder FXDefaultSearchScope -string "SCcf"

# Disable the warning when changing a file extension
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false

# Enable spring loading for directories
defaults write NSGlobalDomain com.apple.springing.enabled -bool true

# Show item info near icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c \
  "Set :DesktopViewSettings:IconViewSettings:showItemInfo true" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :FK_StandardViewSettings:IconViewSettings:showItemInfo true" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :StandardViewSettings:IconViewSettings:showItemInfo true" \
  ~/Library/Preferences/com.apple.finder.plist

# Show item info to the bottom of the icons on the desktop
/usr/libexec/PlistBuddy -c \
  "Set DesktopViewSettings:IconViewSettings:labelOnBottom true" \
  ~/Library/Preferences/com.apple.finder.plist

# Set item text size to 10 on the desktop and in other icon views
/usr/libexec/PlistBuddy -c \
  "Set DesktopViewSettings:IconViewSettings:textSize 10" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :FK_StandardViewSettings:IconViewSettings:textSize 10" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :StandardViewSettings:IconViewSettings:textSize 10" \
  ~/Library/Preferences/com.apple.finder.plist

# Enable snap-to-grid for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c \
  "Set :DesktopViewSettings:IconViewSettings:arrangeBy grid" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :FK_StandardViewSettings:IconViewSettings:arrangeBy grid" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :StandardViewSettings:IconViewSettings:arrangeBy grid" \
  ~/Library/Preferences/com.apple.finder.plist

# Set grid spacing for icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c \
  "Set :DesktopViewSettings:IconViewSettings:gridSpacing 1" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :FK_StandardViewSettings:IconViewSettings:gridSpacing 1" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :StandardViewSettings:IconViewSettings:gridSpacing 1" \
  ~/Library/Preferences/com.apple.finder.plist

# Set the size of icons on the desktop and in other icon views
/usr/libexec/PlistBuddy -c \
  "Set :DesktopViewSettings:IconViewSettings:iconSize 64" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :FK_StandardViewSettings:IconViewSettings:iconSize 64" \
  ~/Library/Preferences/com.apple.finder.plist
/usr/libexec/PlistBuddy -c \
  "Set :StandardViewSettings:IconViewSettings:iconSize 64" \
  ~/Library/Preferences/com.apple.finder.plist

# Use list view in all Finder windows by default
# Four-letter codes for the other view modes: `icnv`, `clmv`, `glyv`
defaults write com.apple.finder FXPreferredViewStyle -string "Nlsv"

# Show the ~/Library folder
chflags nohidden ~/Library && xattr -d com.apple.FinderInfo ~/Library 2>/dev/null

# Show the /Volumes folder
sudo chflags nohidden /Volumes

# Expand the following File Info panes:
# “General”, “Open with”, and “Sharing & Permissions”
defaults write com.apple.finder FXInfoPanesExpanded -dict \
  General -bool true \
  OpenWith -bool true \
  Privileges -bool true

###############################################################################
# Dock                                                                        #
###############################################################################

# Set the icon size of Dock items to 42 pixels
defaults write com.apple.dock tilesize -int 42

# Change minimize/maximize window effect
defaults write com.apple.dock mineffect -string "scale"

# Don’t animate opening applications from the Dock
defaults write com.apple.dock launchanim -bool false

# Don’t automatically rearrange Spaces based on most recent use
defaults write com.apple.dock mru-spaces -bool false

# Don’t show recent applications in Dock
defaults write com.apple.dock show-recents -bool false

# Disable the Launchpad gesture (pinch with thumb and three fingers)
defaults write com.apple.dock showLaunchpadGestureEnabled -int 0

# Make Dock icons of hidden applications translucent
defaults write com.apple.dock showhidden -bool true

###############################################################################
# Safari                                                                      #
###############################################################################

# Hide first-time launch prompts on start page
defaults write com.apple.Safari HideHighlightsEmptyItemViewPreferenceKey -bool true
defaults write com.apple.Safari HideStartPageFrecentsEmptyItemView -bool true
defaults write com.apple.Safari HideStartPageSiriSuggestionsEmptyItemView -bool true

# Do not prompt user to make Safari their default browser
defaults write com.apple.Safari DefaultBrowserPromptingState3 -int 4

# Disable widgets on start page
defaults write com.apple.Safari ShowBackgroundImageInFavorites -bool false
defaults write com.apple.Safari ShowFavorites -bool false
defaults write com.apple.Safari ShowFrequentlyVisitedSites -bool false
defaults write com.apple.Safari ShowHighlightsInFavorites -bool false
defaults write com.apple.Safari ShowPrivacyReportInFavorites -bool false
defaults write com.apple.Safari ShowReadingListInFavorites -bool false

# Do not always restore sessions at launch and do not restore private windows
# (Settings > General > Safari opens with > A new private window)
defaults write com.apple.Safari AlwaysRestoreSessionAtLaunch -bool false
defaults write com.apple.Safari ExcludePrivateWindowWhenRestoringSessionAtLaunch -bool true
defaults write com.apple.Safari OpenPrivateWindowWhenNotRestoringSessionAtLaunch -bool true

# Set Safari’s home page to `about:blank` for faster loading
# (Settings > General > Homepage > about:blank)
defaults write com.apple.Safari HomePage -string "about:blank"

# Set history to clear after one day
# (Settings > General > Remove history items > After one day)
defaults write com.apple.Safari HistoryAgeInDaysLimit -int 1

# Do not open "safe" files automatically after download
# (Settings > General > Open "safe" files after downloading)
defaults write com.apple.Safari AutoOpenSafeDownloads -bool false

# Disable autofill contacts, usernames/passwords, credit cards, and form data
# (Settings > AutoFill)
defaults write com.apple.Safari AutoFillFromAddressBook -bool false
defaults write com.apple.Safari AutoFillPasswords -bool false
defaults write com.apple.Safari AutoFillCreditCardData -bool false
defaults write com.apple.Safari AutoFillMiscellaneousForms -bool false

# Set search engine to DuckDuckGo
# (Settings > Search > Search engine > DuckDuckGo)
defaults write com.apple.Safari SearchProviderShortName -string DuckDuckGo

# Disable search engine suggestions
# (Settings > Search > Include search engine suggestions)
defaults write com.apple.Safari SuppressSearchSuggestions -bool true

# Disable website-specific search
# (Settings > Search > Enable Quick Website Search)
defaults write com.apple.Safari WebsiteSpecificSearchEnabled -bool false

# Disable preloading
# (Settings > Search > Preload Top Hit in the background)
defaults write com.apple.Safari PreloadTopHit -bool false

# Disable favorites in the search bar
# (Settings > Search > Show Favorites)
defaults write com.apple.Safari ShowFavoritesUnderSmartSearchField -bool false

# Disable safe search (sends data to Google Safe Browsing)
# (Settings > Security)
defaults write com.apple.Safari WarnAboutFraudulentWebsites -bool false

# Disable click tracking for ads
# (Settings > Privacy > Allow privacy-preserving measurement of ad effectiveness)
defaults write com.apple.Safari WebKitPreferences.privateClickMeasurementEnabled -bool false

# Show the full URL in the address bar
# (Settings > Advanced > Show full website address)
defaults write com.apple.Safari ShowFullURLInSmartSearchField -bool true

# Set default encoding to UTF-8
# (Settings > Advanced > Default encoding > Unicode (UTF-8))
defaults write com.apple.Safari WebKitDefaultTextEncodingName -string "utf-8"
defaults write com.apple.Safari WebKitPreferences.defaultTextEncodingName -string "utf-8"

# Show develop menubar option
# (Settings > Advanced > Show Develop menu in menu bar)
defaults write com.apple.Safari IncludeDevelopMenu -bool true
defaults write com.apple.Safari WebKitDeveloperExtrasEnabledPreferenceKey -bool true
defaults write com.apple.Safari WebKitPreferences.developerExtrasEnabled -bool true
defaults write com.apple.Safari.SandboxBroker ShowDevelopMenu -bool true

###############################################################################
# Applications                                                                #
###############################################################################

# Activity Monitor: Show the main window when launching
defaults write com.apple.ActivityMonitor OpenMainWindow -bool true

# Activity Monitor: Visualize CPU usage in the Dock icon
defaults write com.apple.ActivityMonitor IconType -int 5

# Activity Monitor: Show all processes
defaults write com.apple.ActivityMonitor ShowCategory -int 0

# Messages: Disable automatic emoji substitution (i.e. use plain text smileys)
defaults write com.apple.messageshelper.MessageController SOInputLineSettings \
  -dict-add "automaticEmojiSubstitutionEnablediMessage" -bool false

# Messages: Disable smart quotes as it’s annoying for messages that contain code
defaults write com.apple.messageshelper.MessageController SOInputLineSettings \
  -dict-add "automaticQuoteSubstitutionEnabled" -bool false

# Messages: Disable continuous spell checking
defaults write com.apple.messageshelper.MessageController SOInputLineSettings \
  -dict-add "continuousSpellCheckingEnabled" -bool false

# Photos: Prevent from opening automatically when devices are plugged in
defaults -currentHost write com.apple.ImageCapture disableHotPlug -bool true

# Terminal: Only use UTF-8 in Terminal.app
defaults write com.apple.terminal StringEncodings -array 4

# Terminal: Disable the annoying line marks
defaults write com.apple.Terminal ShowLineMarks -int 0

# Terminal: Enable Secure Keyboard Entry in Terminal.app
# See: https://security.stackexchange.com/a/47786/8918
defaults write com.apple.terminal SecureKeyboardEntry -bool true

# TextEdit: Use plain text mode for new documents
defaults write com.apple.TextEdit RichText -int 0

# TextEdit: Open and save files as UTF-8
defaults write com.apple.TextEdit PlainTextEncoding -int 4
defaults write com.apple.TextEdit PlainTextEncodingForWrite -int 4

# Time Machine: Prevent prompting to use new hard drives as backup volume
defaults write com.apple.TimeMachine DoNotOfferNewDisksForBackup -bool true

###############################################################################
# Kill affected applications                                                  #
###############################################################################

for app in "Activity Monitor" \
  "Calendar" \
  "cfprefsd" \
  "Contacts" \
  "Dock" \
  "Mail" \
  "Messages" \
  "Photos" \
  "Safari" \
  "SystemUIServer" \
  "iCal"; do
  killall "${app}" &> /dev/null
done
printf "Done. Some of these changes require a restart to take effect.\n"
