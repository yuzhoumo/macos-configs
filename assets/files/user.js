/*
 * Open profile dir - find in about:support or about:profiles
 * Copy this file into your profile directory.
 * Add changes to this file. Save file.
 * Restart Firefox. Below overrides will be loaded.
 * Close Firefox and open prefs.js to confirm changes merged there.
 * NOTE: only non-default values will be saved to prefs.js
 */

/**********************/
/* PRIVACY & SECURITY */
/**********************/

/* Disable telemetry */
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.ping-centre.telemetry", false);
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("devtools.onboarding.telemetry.logged", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("browser.newtabpage.activity-stream.telemetry.ping.endpoint", "");

/* Disable Pocket */
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("extensions.pocket.enabled", false);

/* Disable Pre-fetching */
user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);

/* Disable JS in PDFs */
user_pref("pdfjs.enableScripting", false);

/* Show warning for insecure SSL ciphers */
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);

/* Always deny geolocatoin and notification requests */
user_pref("permissions.default.desktop-notification", 2);
user_pref("permissions.default.geo", 2);

/* Disable geolocation and web notifications */
user_pref("geo.enabled", false);
user_pref("dom.webnotifications.enabled", false);

/* Disable sending additional analytics to web servers */
user_pref("beacon.enabled", false);

/* Disable data & health report */
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

/* Disable search suggesions */
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.showSearchSuggestionsFirst", false);
user_pref("browser.urlbar.suggest.engines", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.suggest.topsites", false);

/* Disable safe browsing (sends web traffic through Google) */
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.appRepURL", "");
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);

/* Disable autofill */
user_pref("signon.autofillForms", false);
user_pref("signon.generation.enabled", false);
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("signon.rememberSignons", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);

/* Enable HTTPS everywhere */
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_ever_enabled", true);

/* Sanitize browser data on shutdown */
user_pref("privacy.history.custom", true);
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown.cookies", false);
user_pref("privacy.clearOnShutdown.sessions", false);

/* Disallow battery reading (reduce fingerprinting) */
user_pref("dom.battery.enabled", false);

/* Disable Hybdrid Content telemetry */
user_pref("toolkit.telemetry.hybridContent.enabled", false); 

/* https://www.reddit.com/r/firefox/comments/9eb9o2/firefox_has_the_privacy_option_to_mitigate_tls */
user_pref("security.ssl.disable_session_identifiers", true);

/* trr.mode 5 is no DOH. 2 is enable DOH. 3 is no failback to system dns (no dns leaks) */
user_pref("network.trr.mode", 5);
user_pref("network.trr.default_provider_uri", "https://dns.quad9.net/dns-query");
user_pref("network.trr.uri", "https://dns.quad9.net/dns-query");
user_pref("network.trr.custom_uri", "https://dns.quad9.net/dns-query");
user_pref("network.trr.bootstrapAddress", "9.9.9.9");

/********************/
/* USER PREFERENCES */
/********************/

/* Change homepage */
user_pref("browser.startup.homepage", "https://duckduckgo.com/");

/* Show and enable compact mode (FF89) */
user_pref("browser.compactmode.show", true);
user_pref("browser.uidensity", 1);

/* Enable secondary search bar */
user_pref("browser.search.widget.inNavBar", true);

/* Set bookmarks toolbar to always be visible */
user_pref("browser.toolbars.bookmarks.visibility", "always");

/* Configure new tab page */
user_pref("browser.newtabpage.activity-stream.section.highlights.includeBookmarks", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeDownloads", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includeVisited", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.disableSnippets", true);
user_pref("browser.newtabpage.activity-stream.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.highlights", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.migrationExpired", true);
user_pref("browser.newtabpage.activity-stream.prerender", false);
user_pref("browser.newtabpage.activity-stream.showSearch", false);
user_pref("browser.newtabpage.activity-stream.showTopSites", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.directory.source", "");
user_pref("browser.newtabpage.directory.ping", "");
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.newtabpage.enhanced", false);
user_pref("browser.newtabpage.introShown", true);

/* Disable "Recommend extensions" */
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

/*****************/
/* MISC SETTINGS */
/*****************/

user_pref("view_source.wrap_long_lines", true);
user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("network.IDN_show_punycode", true);
