-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Define aliases for prettier tab names
local icons = {
  ["wslhost.exe"]     = "Wsl",
  ["bash.exe"]        = "GitBash",
  ["powershell.exe"]  = "PowerShell",
  ["cmd.exe"]         = "Cmd",
}

-- hold the configuration.
local config = wezterm.config_builder()

config.keys = {
  {
    key = "Space",
    mods = "CTRL",
    action = wezterm.action.ShowLauncherArgs { flags = 'LAUNCH_MENU_ITEMS' },
  },
}

-- Set configurations needed in Windows. Change the default_domain to the right version of WSL if needed
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    -- set ubuntu as default when opening.
    config.default_domain = 'WSL:Ubuntu-22.04'

    -- set powershell as default shell in windows. So that it gives the option to open a new tab in it when right click
    config.default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe' }

    -- get rid of title bar in the window
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.integrated_title_button_style = "Windows"

	config.launch_menu = {
    { label = "WSL", args = { "wsl", "--cd", "~" } },
		{ label = "PowerShell", domain = { DomainName = "local" }, args = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe' },},
		{ label = "GitBash", domain = { DomainName = "local" },	args = {"C:\\Program Files\\Git\\bin\\bash.exe", "-i", "-l"},	},
	}



elseif wezterm.target_triple == 'x86_64-unknown-linux-gnu' then
    config.enable_wayland = false
    config.window_decorations = "RESIZE"
    config.use_fancy_tab_bar = false

    config.hide_tab_bar_if_only_one_tab = true

    config.window_padding = {
        left = 10,
        right = 10,
        -- top = -10,
        -- bottom = -10
    }
end

-- set color scheme my usuals that come by default are:
-- 'nightfox', 'TweakedPandora' , 'Night Owl (Gogh)', 'Kanagawa (Gogh)', 'kanagawabones'
theme = 'TweakedPandora'

config.color_scheme = theme

-- set tab passive and active background colors based on theme. Chose contrasting colors
-- for the tab
if theme == 'TweakedPandora' then
  themePassiveBackground = '#20306A'
  themeActiveBackground = '#141e43'
elseif theme == 'Night Owl (Gogh)' then
  themePassiveBackground = '#023259'
  themeActiveBackground = '#011627'
elseif theme == 'nightfox' then
  themePassiveBackground = '#2A3B52'
  themeActiveBackground = '#192330'
elseif theme == 'Kanagawa (Gogh)' then
  themePassiveBackground = '#353545'
  themeActiveBackground = '#1F1F28'
elseif theme == 'kanagawabones' then
  themePassiveBackground = '#353545'
  themeActiveBackground = '#1F1F28'
else -- default
  themePassiveBackground = 'black'
  themeActiveBackground = '#5ae8c2'
end

-- set font
-- config.font = wezterm.font('Iosevka Nerd Font', { weight = 'Medium' })
-- config.font = wezterm.font('Hack Nerd Font', { weight = 'Regular' })
config.font = wezterm.font('FiraCode Nerd Font', { weight = 'Regular' })

-- set font size
-- config.font_size = 14
config.font_size = 12
config.line_height = 1.2

-- set opening window size
config.initial_rows = 30
config.initial_cols = 110

-- shut annoying sound off
config.audible_bell = "Disabled"

-- Format tabs
config.tab_max_width = 15
-- config.tab_bar_at_bottom = false
-- config.use_fancy_tab_bar = true
--
wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)

    if tab.is_active then
      background = themeActiveBackground
    else
      background = themePassiveBackground
    end
    local pane = tab.active_pane
    local process_name = string.gsub(pane.foreground_process_name, "(.*[/\\])", "")
    local title = icons[process_name] or process_name

    -- Pad tabs
    local title_width = wezterm.column_width(title)
    local remaining = max_width - title_width
    local left_pad = math.floor(remaining / 2)
    local right_pad = remaining - left_pad

    return {
      { Background = { Color = background } },
      { Text = string.rep(" ", left_pad) .. title .. string.rep(" ", right_pad) },}
  end
)



-- return the configuration to wezterm
return config

