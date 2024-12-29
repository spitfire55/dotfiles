local wezterm = require("wezterm")
local mux = wezterm.mux

wezterm.on('gui-attached', function(domain)
  -- maximize all displayed windows on startup
  local workspace = mux.get_active_workspace()
  for _, window in ipairs(mux.all_windows()) do
    if window:get_workspace() == workspace then
      window:gui_window():maximize()
    end
  end
end)

local config = {
	default_prog = { "/usr/bin/zsh" },
	font = wezterm.font("BerkeleyMono Nerd Font"),
	color_scheme = "Kanagawa (Gogh)",
	enable_tab_bar = false,
	force_reverse_video_cursor = true,
}

return config
