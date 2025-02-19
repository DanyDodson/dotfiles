config.load_autoconfig()

config.source('qutebrowser-themes/onedark.py')

c.qt.highdpi = True

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = 'auto'

c.content.user_stylesheets = ["user.css"]

c.window.hide_decoration = True

c.statusbar.show = "never"

c.editor.command = ['codium', '-n', '{file}', '-w']

c.auto_save.session = True

c.completion.height = "20%"

c.scrolling.smooth = True

c.downloads.location.prompt = True

c.url.start_pages = "about:blank"  # "https://ape3000.com/"
c.url.default_page = "about:blank" # "https://roadmap.sh/"

c.url.searchengines = {"DEFAULT": "https://www.google.fi/search?q={}"}

c.content.autoplay = False

c.content.pdfjs = True

config.set('content.images', True, 'chrome-devtools://*')
config.set('content.images', True, 'devtools://*')

config.set('content.javascript.enabled', True, 'chrome-devtools://*')
config.set('content.javascript.enabled', True, 'devtools://*')
config.set('content.javascript.enabled', True, 'chrome://*/*')
config.set('content.javascript.enabled', True, 'qute://*/*')

config.set('content.cookies.accept', 'all', 'chrome-devtools://*')
config.set('content.cookies.accept', 'all', 'devtools://*')

config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/{webkit_version} (KHTML, like Gecko) {upstream_browser_key}/{upstream_browser_version} Safari/{webkit_version}', 'https://web.whatsapp.com/')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://accounts.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99 Safari/537.36', 'https://*.slack.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://docs.google.com/*')
config.set('content.headers.user_agent', 'Mozilla/5.0 ({os_info}; rv:71.0) Gecko/20100101 Firefox/71.0', 'https://drive.google.com/*')

c.tabs.show = "multiple"
c.tabs.favicons.show = "never"
c.tabs.indicator.width = 0
c.tabs.background = True
c.tabs.title.format = "{current_title}"

c.colors.tabs.selected.even.bg = "#202429"
c.colors.tabs.selected.odd.bg = c.colors.tabs.selected.even.bg
c.colors.tabs.selected.even.fg = "#b7c8ed"
c.colors.tabs.selected.odd.fg = c.colors.tabs.selected.even.fg

c.colors.tabs.even.bg = "#202429"
c.colors.tabs.odd.bg = c.colors.tabs.even.bg
c.colors.tabs.even.fg = "#464c5a"
c.colors.tabs.odd.fg = c.colors.tabs.even.fg

c.colors.tabs.pinned.even.bg = '#202429'
c.colors.tabs.pinned.odd.bg = c.colors.tabs.pinned.even.bg
c.colors.tabs.pinned.even.fg = '#464c5a'
c.colors.tabs.pinned.odd.fg = c.colors.tabs.pinned.even.fg

c.tabs.padding = {"left": 15, "right": 15, "top": 0, "bottom": 1}

config.bind(',mpv', 'spawn --detach mpv {url}')

config.bind("<Shift+Cmd+,>", "config-source")

config.bind('h', 'scroll left')
config.bind('j', 'scroll down')
config.bind('k', 'scroll up')
config.bind('l', 'scroll right')

config.bind("<ctrl+k>", "tab-next")
config.bind("<ctrl+j>", "tab-prev")

config.unbind("<ctrl+q>")
config.bind("<ctrl+q>", "wq")

config.bind('1p', 'spawn --userscript 1password')

config.bind('xs', 'config-cycle statusbar.show always never')
config.bind('xt', 'config-cycle tabs.show always never')

config.bind(',ap', 'config-cycle content.user_stylesheets ~/.qutebrowser/user.css ""')
