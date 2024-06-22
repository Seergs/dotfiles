local w = require 'utils/wallpaper'
local b = require 'utils/background'
local k = require("utils/keys")

local wezterm = require("wezterm")
local act = wezterm.action


return {
    -- background = {
    --     w.get_wallpaper(),
    --     b.get_background(),
    -- },

	color_scheme = 'Catppuccin Mocha',
	font_size = 16.0,
	macos_window_background_blur = 19,
	window_background_opacity = 1.0,
    window_padding = {
        left = 30,
        right = 30,
        top = 20,
        bottom = 10,
    },
    enable_tab_bar = false,
    window_close_confirmation = 'NeverPrompt',
    window_decorations = 'RESIZE',
	keys = {
        	k.cmd_key(
			"R",
			act.Multiple({
				act.SendKey({ key = "\x1b" }), -- escape
				k.multiple_actions(":source %"),
			})
		),
	},
}
