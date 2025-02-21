local wezterm = require("wezterm")

local config = {
	default_prog = { "/bin/zsh" },
	font = wezterm.font("BerkeleyMono Nerd Font"),
	font_size = 12,
	color_scheme = "Kanagawa (Gogh)",
	colors = {
		background = "black",
	},
	enable_tab_bar = false,
}

return config
