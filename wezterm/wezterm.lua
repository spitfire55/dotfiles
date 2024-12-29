local wezterm = require("wezterm")

local config = {
	default_prog = { "/usr/bin/zsh" },
	font = wezterm.font("BerkeleyMono Nerd Font"),
	color_scheme = "Kanagawa (Gogh)",
	enable_tab_bar = false,
	force_reverse_video_cursor = true,
}

return config
