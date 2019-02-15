# Autogenerated config.py
# Documentation:
#   qute://help/configuring.html
#   qute://help/settings.html

# Uncomment this to still load settings configured via autoconfig.yml
# config.load_autoconfig()

# Aliases for commands. The keys of the given dictionary are the
# aliases, while the values are the commands they map to.
# Type: Dict
c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save', 'csf': 'config-write-py --force'}

# When to find text on a page case-insensitively.
# Type: String
# Valid values:
#   - always: Search case-insensitively.
#   - never: Search case-sensitively.
#   - smart: Search case-sensitively if there are capital characters.
c.search.ignore_case = 'smart'

# Backend to use to display websites. qutebrowser supports two different
# web rendering engines / backends, QtWebKit and QtWebEngine. QtWebKit
# was discontinued by the Qt project with Qt 5.6, but picked up as a
# well maintained fork: https://github.com/annulen/webkit/wiki -
# qutebrowser only supports the fork. QtWebEngine is Qt's official
# successor to QtWebKit. It's slightly more resource hungry than
# QtWebKit and has a couple of missing features in qutebrowser, but is
# generally the preferred choice.
# Type: String
# Valid values:
#   - webengine: Use QtWebEngine (based on Chromium).
#   - webkit: Use QtWebKit (based on WebKit, similar to Safari).
c.backend = 'webengine'

# Force software rendering for QtWebEngine. This is needed for
# QtWebEngine to work with Nouveau drivers and can be useful in other
# scenarios related to graphic issues.
# Type: String
# Valid values:
#   - software-opengl: Tell LibGL to use a software implementation of GL (`LIBGL_ALWAYS_SOFTWARE` / `QT_XCB_FORCE_SOFTWARE_OPENGL`)
#   - qt-quick: Tell Qt Quick to use a software renderer instead of OpenGL. (`QT_QUICK_BACKEND=software`)
#   - chromium: Tell Chromium to disable GPU support and use Skia software rendering instead. (`--disable-gpu`)
#   - none: Don't force software rendering.
c.qt.force_software_rendering = 'none'

# When to use Chromium's low-end device mode. This improves the RAM
# usage of renderer processes, at the expense of performance.
# Type: String
# Valid values:
#   - always: Always use low-end device mode.
#   - auto: Decide automatically (uses low-end mode with < 1 GB available RAM).
#   - never: Never use low-end device mode.
c.qt.low_end_device_mode = 'auto'

# Turn on Qt HighDPI scaling. This is equivalent to setting
# QT_AUTO_SCREEN_SCALE_FACTOR=1 in the environment. It's off by default
# as it can cause issues with some bitmap fonts. As an alternative to
# this, it's possible to set font sizes and the `zoom.default` setting.
# Type: Bool
c.qt.highdpi = True

# Time interval (in milliseconds) between auto-saves of
# config/cookies/etc.
# Type: Int
c.auto_save.interval = 15000

# Always restore open sites when qutebrowser is reopened.
# Type: Bool
c.auto_save.session = False

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'file://*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'chrome://*/*')

# Enable JavaScript.
# Type: Bool
config.set('content.javascript.enabled', True, 'qute://*/*')

# Proxy to use. In addition to the listed values, you can use a
# `socks://...` or `http://...` URL.
# Type: Proxy
# Valid values:
#   - system: Use the system wide proxy.
#   - none: Don't use any proxy
c.content.proxy = 'system'

# Editor (and arguments) to use for the `open-editor` command. The
# following placeholders are defined: * `{file}`: Filename of the file
# to be edited. * `{line}`: Line in which the caret is found in the
# text. * `{column}`: Column in which the caret is found in the text. *
# `{line0}`: Same as `{line}`, but starting from index 0. * `{column0}`:
# Same as `{column}`, but starting from index 0.
# Type: ShellCommand
c.editor.command = ['nvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']

# Encoding to use for the editor.
# Type: Encoding
c.editor.encoding = 'utf-8'

# When a hint can be automatically followed without pressing Enter.
# Type: String
# Valid values:
#   - always: Auto-follow whenever there is only a single hint on a page.
#   - unique-match: Auto-follow whenever there is a unique non-empty match in either the hint string (word mode) or filter (number mode).
#   - full-match: Follow the hint when the user typed the whole hint (letter, word or number mode) or the element's text (only in number mode).
#   - never: The user will always need to press Enter to follow a hint.
c.hints.auto_follow = 'unique-match'

# Duration (in milliseconds) to ignore normal-mode key bindings after a
# successful auto-follow.
# Type: Int
c.hints.auto_follow_timeout = 0

# Enable smooth scrolling for web pages. Note smooth scrolling does not
# work with the `:scroll-px` command.
# Type: Bool
c.scrolling.smooth = False

# Search engines which can be used via the address bar. Maps a search
# engine name (such as `DEFAULT`, or `ddg`) to a URL with a `{}`
# placeholder. The placeholder will be replaced by the search term, use
# `{{` and `}}` for literal `{`/`}` signs. The search engine named
# `DEFAULT` is used when `url.auto_search` is turned on and something
# else than a URL was entered to be opened. Other search engines can be
# used by prepending the search engine name to the search term, e.g.
# `:open google qutebrowser`.
# Type: Dict
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}', 'git': 'https://github.com/search?q={}', 'aw': 'https://wiki.archlinux.org/index.php?search={}'}

# Default monospace fonts. Whenever "monospace" is used in a font
# setting, it's replaced with the fonts listed here.
# Type: Font
c.fonts.monospace = 'hack'

# Font used in the completion widget.
# Type: Font
c.fonts.completion.entry = '9pt hack'

# Font used in the completion categories.
# Type: Font
c.fonts.completion.category = '9pt hack'

# Font used for the debugging console.
# Type: QtFont
c.fonts.debug_console = '10pt hack'

# Font used for the downloadbar.
# Type: Font
c.fonts.downloads = '9pt hack'

# Font used for the hints.
# Type: Font
c.fonts.hints = 'bold 9pt hack'

# Font used in the keyhint widget.
# Type: Font
c.fonts.keyhint = '9pt hack'

# Font used for error messages.
# Type: Font
c.fonts.messages.error = '9pt hack'

# Font used for info messages.
# Type: Font
c.fonts.messages.info = '9pt hack'

# Font used for warning messages.
# Type: Font
c.fonts.messages.warning = '9pt hack'

# Font used for prompts.
# Type: Font
c.fonts.prompts = 'hack'

# Font used in the statusbar.
# Type: Font
c.fonts.statusbar = 'bold 9pt hack'

# Font used in the tab bar.
# Type: QtFont
c.fonts.tabs = 'bold 1hack'

# Font family for standard fonts.
# Type: FontFamily
c.fonts.web.family.standard = '12'

# Font family for fixed fonts.
# Type: FontFamily
c.fonts.web.family.fixed = 'cantarell'

# Font family for serif fonts.
# Type: FontFamily
c.fonts.web.family.serif = 'cantarell'

# Font family for sans-serif fonts.
# Type: FontFamily
c.fonts.web.family.sans_serif = 'cantarell'

# Font family for cursive fonts.
# Type: FontFamily
c.fonts.web.family.cursive = 'cantarell'

# Font family for fantasy fonts.
# Type: FontFamily
c.fonts.web.family.fantasy = 'cantarell'

# Default font size (in pixels) for regular text.
# Type: Int
c.fonts.web.size.default = 12

# Default font size (in pixels) for fixed-pitch text.
# Type: Int
c.fonts.web.size.default_fixed = 12

# Hard minimum font size (in pixels).
# Type: Int
c.fonts.web.size.minimum = 8

# Minimum logical font size (in pixels) that is applied when zooming
# out.
# Type: Int
c.fonts.web.size.minimum_logical = 8

# Bindings for normal mode
config.bind('x', "hint links spawn mpv '{hint-url}'")
