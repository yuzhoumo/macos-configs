/*
 * Joe's Firefox user settings
 *
 * Copy this file into profile directory (find in about:profiles)
 * Restart Firefox. Below overrides will be loaded.
 */

/*********/
/* UI/UX */
/*********/

/* Disable What's New toolbar icon */
user_pref("browser.messaging-system.whatsNewPanel.enabled", false);

/* Enable dark theme */
user_pref("ui.systemUsesDarkTheme", 1);

/* Change homepage */
user_pref("browser.startup.homepage", "https://start.duckduckgo.com/");

/* Move sidebar to the right */
user_pref("sidebar.position_start", false);

/* Show and enable compact mode (FF89) */
user_pref("browser.compactmode.show", true);
user_pref("browser.uidensity", 1);

/* Set bookmarks toolbar to always be visible */
user_pref("browser.toolbars.bookmarks.visibility", "always");

/* Disable about:config warning */
user_pref("browser.aboutConfig.showWarning", false);

/* Disable default browser check */
user_pref("browser.shell.checkDefaultBrowser", false);

/* Configure new tab page */
user_pref("browser.newtabpage.activity-stream.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.topsites", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.activity-stream.feeds.snippets", false);
user_pref("browser.newtabpage.activity-stream.feeds.section.topstories", false);
user_pref("browser.newtabpage.activity-stream.section.highlights.includePocket", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.feeds.discoverystreamfeed", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.default.sites", "");

/* Disable "Recommend extensions" */
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.addons", false);
user_pref("browser.newtabpage.activity-stream.asrouter.userprefs.cfr.features", false);

/* Wrap long lines in source view */
user_pref("view_source.wrap_long_lines", true);

/* Disable recommendation pane in about:addons (uses Google Analytics) */
user_pref("extensions.getAddons.showPane", false);

/* Disable recommendations in about:addons' Extensions and Themes panes */
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);

/* Disable Pocket */
user_pref("extensions.pocket.enabled", false);

/***************/
/* GEOLOCATION */
/***************/

/* Disable using the OS's geolocation service */
user_pref("geo.provider.ms-windows-location", false); // [WINDOWS]
user_pref("geo.provider.use_corelocation", false); // [MAC]
user_pref("geo.provider.use_gpsd", false); // [LINUX]

/* Disable region updates */
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);

/*************************/
/* TELEMETRY & ANALYTICS */
/*************************/

/* Disable telemetry */
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false); // Background Hang Reporter
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.coverage.endpoint.base", "");
user_pref("browser.ping-centre.telemetry", false);

/* Disable Hybdrid Content telemetry */
user_pref("toolkit.telemetry.hybridContent.enabled", false);

/* Disable data & health report */
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);

/* Disable sending additional analytics to web servers */
user_pref("beacon.enabled", false);

/* Disable Studies*/
user_pref("app.shield.optoutstudies.enabled", false);

/* Disable Normandy/Shield 
 * Shield is a telemetry system that can push and test "recipes" */
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");

/* Disable Crash Reports */
user_pref("breakpad.reportURL", "");
user_pref("browser.tabs.crashReporting.sendReport", false);

/* Enforce no submission of backlogged Crash Reports */
user_pref("browser.crashReports.unsubmittedCheck.autoSubmit2", false);

/********************/
/* SEARCH & URL BAR */
/********************/

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
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.url", "");
user_pref("browser.safebrowsing.appRepURL", "");
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.safebrowsing.blockedURIs.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);
user_pref("browser.safebrowsing.allowOverride", false);

/* Disable location bar domain guessing */
user_pref("browser.fixup.alternate.enabled", false);

/* Display all parts of the url in the location bar ***/
user_pref("browser.urlbar.trimURLs", false);

/* Represent unicode with limited character subset for hostnames
 * Hardens against phishing attacks (does not render non-latin characters) */
user_pref("network.IDN_show_punycode", true);

/*****************/
/* NETWORK & DNS */
/*****************/

/* Enable HTTPS everywhere */
user_pref("dom.security.https_only_mode", true);
user_pref("dom.security.https_only_mode_ever_enabled", true);

/* Disable Network Connectivity checks */
user_pref("network.connectivity-service.enabled", false);

/* Disable link prefetching */
user_pref("network.prefetch-next", false);

/* Disable DNS prefetching */
user_pref("network.dns.disablePrefetch", true);

/* Disable predictor/prefetching */
user_pref("network.predictor.enabled", false);
user_pref("network.predictor.enable-prefetch", false);

/* Disable link-mouseover opening connection to linked server */
user_pref("network.http.speculative-parallel-limit", 0);

/* Disable mousedown speculative connections on bookmarks and history */
user_pref("browser.places.speculativeConnect.enabled", false);

/* Disable ipv6 */
user_pref("network.dns.disableIPv6", true);

/* Disable DNS over HTTPS
 * 5 is no DOH. 2 is enable DOH. 3 is no failback to system dns (no dns leaks) */
user_pref("network.trr.mode", 5);

/*******************/
/* HISTORY & FORMS */
/*******************/

/* Disable autofill */
user_pref("browser.formfill.enable", false);
user_pref("signon.autofillForms", false);
user_pref("signon.generation.enabled", false);
user_pref("signon.management.page.breach-alerts.enabled", false);
user_pref("signon.rememberSignons", false);
user_pref("extensions.formautofill.available", false);
user_pref("extensions.formautofill.creditCards.available", false);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.formautofill.heuristics.enabled", false);

/* Disable formless login capture for Password Manager */
user_pref("signon.formlessCapture.enabled", false);

/* Sanitize browser data on shutdown */
user_pref("privacy.history.custom", true);
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.clearOnShutdown.cache", true);
user_pref("privacy.clearOnShutdown.downloads", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.sessions", true);
user_pref("privacy.clearOnShutdown.offlineApps", false);
user_pref("privacy.clearOnShutdown.cookies", false);

/* Reset default "Time range to clear" for "Clear Recent History" 
 * 0=everything, 1=last hour, 2=last two hours, 3=last four hours, 4=today */
user_pref("privacy.sanitize.timeSpan", 0);

/* Reset default items to clear with Ctrl-Shift-Del
 * This dialog can also be accessed from the menu History>Clear Recent History */
user_pref("privacy.cpd.cache", true); 
user_pref("privacy.cpd.formdata", true);
user_pref("privacy.cpd.history", true);
user_pref("privacy.cpd.sessions", true);
user_pref("privacy.cpd.offlineApps", false);
user_pref("privacy.cpd.cookies", false);

/******************/
/* FINGERPRINTING */
/******************/

/* Mitigate tracking through TLS session ids
 * https://www.reddit.com/r/firefox/comments/9eb9o2/firefox_has_the_privacy_option_to_mitigate_tls */
user_pref("security.ssl.disable_session_identifiers", true);

/* Disallow reading battery status (reduce fingerprinting) */
user_pref("dom.battery.enabled", false);

/*********/
/* OTHER */
/*********/

/* Enable global privacy control */
user_pref("privacy.globalprivacycontrol", true);
user_pref("privacy.globalprivacycontrol.functionality.enabled", true);

/* Disable JS in PDFs */
user_pref("pdfjs.enableScripting", false);

/* Show warning for insecure SSL ciphers */
user_pref("security.ssl.treat_unsafe_negotiation_as_broken", true);
