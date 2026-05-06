---- Pull in the wezterm API ----
local wezterm = require("wezterm")

---- This will hold the configuration ----
local config = wezterm.config_builder()

---- Color scheme (Find more at https://wezfurlong.org/wezterm/colorschemes/) ---
config.color_scheme = "nord"

---- Font configuration (Requires a Nerd Font installed on your system) ----
config.font = wezterm.font("CaskaydiaCove Nerd Font Mono")
config.font_size = 17.0

---- Window styling ----
---- config.window_background_opacity = 0.90
config.window_decorations = "RESIZE" -- Removes title bar on some environments
config.enable_tab_bar = true
config.use_fancy_tab_bar = false

---- Wayland compatability ----
config.enable_wayland = false

---- Rounding corners ----
wezterm.on("format-tab-title", function(tab)
	local background = "#3b4252" -- Inactive tab background (Nord example)
	local foreground = "#d8dee9" -- Inactive tab text

	if tab.is_active then
		background = "#88c0d0" -- Active pill color
		foreground = "#2e3440" -- Active text color
	end

	local edge_foreground = background

	return {
		{ Background = { Color = "none" } }, -- Makes the area outside the pill transparent
		{ Foreground = { Color = edge_foreground } },
		{ Text = "" }, -- Left rounded cap
		{ Background = { Color = background } },
		{ Foreground = { Color = foreground } },
		{ Text = " " .. tab.tab_index + 1 .. " " .. tab.active_pane.title .. " " },
		{ Background = { Color = "none" } },
		{ Foreground = { Color = edge_foreground } },
		{ Text = "" }, -- Right rounded cap
		{ Text = " " }, -- Gap between pills
	}
end)

config.colors = {
	tab_bar = {
		background = "rgba(0, 0, 0, 0)", -- Makes the bar "invisible" so pills float
	},
}

return config
