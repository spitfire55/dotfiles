local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on("gui-attached", function(domain)
	-- maximize all displayed windows on startup
	local workspace = mux.get_active_workspace()
	for _, window in ipairs(mux.all_windows()) do
		if window:get_workspace() == workspace then
			window:gui_window():maximize()
		end
	end
end)

local config = {
	default_prog = { "/bin/zsh" },
	font = wezterm.font("BerkeleyMono Nerd Font"),
	font_size = 14,
	color_scheme = "Tokyo Night (Gogh)",
	enable_tab_bar = false,
}

return config
