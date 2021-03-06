# macOS Configurations

![desktop screenshot](assets/images/screenshot.png)

The goal of this project is to configure a fresh install of macOS as fast as
possible. Scripts can be run individually or all together via `run/run.sh`. 
My dotfiles are pulled from a separate repository hosted
[here](https://github.com/yuzhoumo/dotfiles). These scripts were designed
with idempotency in mind and can be re-run periodically.

## One-line interactive install

This will first run the automated setup, then guide the user through manual steps.

```
mkdir ~/Desktop/macos-configs && cd ~/Desktop/macos-configs && curl -#L https://github.com/yuzhoumo/macos-configs/tarball/main --silent | tar -xzv --strip-components 1 --exclude={README.md,LICENSE} && ./run/run.sh
```

## Documentation

### Scripts

Run scripts in the following order:

* `macos.sh`: Set various system settings
*  `font.sh`: Install fonts from assets directory
*   `dot.sh`: Install dotfiles from [Github](https://github.com/yuzhoumo/dotfiles)
*  `brew.sh`: Install packages using Homebrew
*  `icon.sh`: Set custom icons for certain apps
*  `dock.sh`: Set application shortcuts in the Dock
*  `post.sh`: Set various tweaks after environment is set up

### Manually configured settings

Could not find a way to automate these settings.
Some existing methods were broken since the Big Sur update.

* `System Preferences > Security & Privacy > FileVault`: Turn on FileVault
* `System Preferences > Security & Privacy > Privacy`: Configure as needed
* `System Preferences > Extensions`: Uncheck unecessary extensions
* `System Preferences > General`: Set "Recent Items" to "none"
* `System Preferences > Spotlight > Search Results`: Check "Applications", 
"Folders", "Fonts", "PDF Documents", "System Preferences"
* `System Preferences > Accessibility > Display`: Check "Reduce Transparency"
* `Menu Bar > Finder > Preferences > Sidebar`: Uncheck "iCloud Drive", 
"Cloud Storage", "Bonjour Computers"

### Web browser configurations

**Firefox**
- Import user.js config from `assets/files`
- Sync with Firefox account
- Set default search engine, set device name, and configure toolbar

**Chromium**
- Add extension support:
  * https://github.com/NeverDecaf/chromium-web-store
  * Install: uBlock Origin, DuckDuckGo Essentials, Return YouTube Dislike
- `Sync and Google services`: Uncheck "Autocomplete searches and URLs"
- `Autofill`: Uncheck everything
- `Security and Privacy`:
  * Security: Check "Always use secure connections"
  * Cookies and other site data: 
    - Check "Block third-party cookies"
    - Check "Clear cookies and site data when you close all windows"
- `Appearance`: Check "Show bookmarks bar"
- `On startup`: Check "Open the New Tab Page"

**Safari**
- `General`:
  * Set "Safari opens with" to "Private Window"
  * Set "Homepage" to "about`:blank"
  * Set "Remove history items" to "After one day"
  * Uncheck "Open safe files after downloading"
- `AutoFill`: Uncheck everything
- `Search`:
  * Set "Search engine" to "DuckDuckGo"
  * Uncheck everything
- `Security`: Uncheck "Warn when visiting fraudulent website"
- `Privacy`:
  * Uncheck "Hide IP address"
  * Uncheck "Allow privacy-preserving measurement of ad effectiveness"
- `Website`: Deny Location and Notifications
- `Advanced`:
  * Check Show full website address
  * Set "Default encoding" to "Unicode (UTF-8)"
  * Check "Show Develop menu in menu bar"

