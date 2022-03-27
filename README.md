# Configurations

## MacOS Configuration

Run scripts in the following order:

* macos.sh: Set various system settings
* brew.sh: Install packages using Homebrew
* icon.sh: Set custom icons for certain apps
* dock.sh: Set application shortcuts in the Dock
* post.sh: Set various tweaks after environment is setup

Manually configured settings:

Could not find a way to automate these settings.
Some existing methods were broken since the Big Sur update.

* System Preferences > Security & Privacy > FileVault:
  - Turn on FileVault
* System Preferences > Security & Privacy > Privacy:
  - Configure as needed
* System Preferences > Extensions:
  - Uncheck unecessary extensions
* System Preferences > General:
  - Set "Recent Items" to "none"
* System Preferences > Spotlight > Search Results:
  - Check "Applications", "Folders", "Fonts", "PDF Documents", "System Preferences"
* System Preferences > Accessibility > Display:
  - Check "Reduce Transparency"
* Menu Bar > Finder > Preferences > Sidebar:
  - Uncheck iCloud Drive, Cloud Storage, Bonjour Computers
