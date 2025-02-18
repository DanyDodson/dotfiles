config.load_autoconfig()

config.source('qutebrowser-themes/onedark.py')

c.qt.highdpi = True

c.colors.webpage.darkmode.enabled = True
c.colors.webpage.preferred_color_scheme = 'dark'

c.content.user_stylesheets = ["user.css"]

c.window.hide_decoration = True

c.statusbar.show = "never"

c.editor.command = ['codium', '-n', '{file}', '-w']

c.auto_save.session = True

c.completion.height = "20%"

c.scrolling.smooth = True

c.downloads.location.prompt = True

c.url.start_pages = "about:blank"  # "https://ape3000.com/"

c.url.default_page = "about:blank"

c.url.searchengines = {"DEFAULT": "https://www.google.fi/search?q={}"}

c.content.autoplay = False

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

c.tabs.padding = {"left": 15, "right": 15, "top": 0, "bottom": 1}

config.bind(',mpv', 'spawn --detach mpv {url}')

config.bind("<Shift+Cmd+,>", "config-source")

config.unbind("<k>")
config.unbind("<j>")
config.bind("<ctrl+k>", "tab-next")
config.bind("<ctrl+j>", "tab-prev")

config.unbind("<ctrl+q>")
config.bind("<ctrl+q>", "wq")

config.bind('1p', 'spawn --userscript 1password')
