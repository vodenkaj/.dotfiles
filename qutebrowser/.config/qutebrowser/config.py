c.editor.command = ["sh", "-c", "alacritty -e nvim {}"]

config.bind("<Ctrl-h>", 'tab-prev')
config.bind("<Ctrl-l>", 'tab-next')
config.bind("<Ctrl-o>", 'back')
config.bind("<Ctrl-i>", 'forward')

config.load_autoconfig()
