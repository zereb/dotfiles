c.aliases = {'w': 'session-save', 'q': 'quit', 'wq': 'quit --save', 'csf': 'config-write-py --force', 'cls': 'config-source'}
c.search.ignore_case = 'smart'
c.backend = 'webengine'
c.qt.force_software_rendering = 'none'
c.qt.low_end_device_mode = 'auto'
c.qt.highdpi = True
c.auto_save.interval = 15000
c.auto_save.session = False
config.set('content.javascript.enabled', True, 'file://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')
c.editor.command = ['nvim', '-f', '{file}', '-c', 'normal {line}G{column0}l']
c.editor.encoding = 'utf-8'
c.hints.auto_follow = 'unique-match'
c.scrolling.smooth = False
c.url.searchengines = {'DEFAULT': 'https://www.google.com/search?q={}', 'git': 'https://github.com/search?q={}', 'aw': 'https://wiki.archlinux.org/index.php?search={}'}
c.fonts.monospace = 'hack'
c.fonts.completion.entry = '9pt hack'
c.fonts.completion.category = '9pt hack'
c.fonts.debug_console = '10pt hack'
c.fonts.downloads = '9pt hack'
c.fonts.hints = 'bold 9pt hack'
c.fonts.keyhint = '9pt hack'
c.fonts.messages.error = '9pt hack'
c.fonts.messages.info = '9pt hack'
c.fonts.messages.warning = '9pt hack'
c.fonts.prompts = 'hack'
c.fonts.statusbar = 'bold 9pt hack'
c.fonts.tabs = 'bold hack'
c.fonts.web.family.standard = '10'
c.fonts.web.family.fixed = 'cantarell'
c.fonts.web.family.serif = 'cantarell'
c.fonts.web.family.sans_serif = 'cantarell'
c.fonts.web.family.cursive = 'cantarell'
c.fonts.web.family.fantasy = 'cantarell'
c.fonts.web.size.default = 11
c.fonts.web.size.default_fixed = 11
c.fonts.web.size.minimum = 0
c.fonts.web.size.minimum_logical = 6
config.bind('X', "hint links spawn mpv '{hint-url}'")
config.bind('x', "spawn mpv '{url}'")
