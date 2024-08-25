-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- hold the configuration.
local config = wezterm.config_builder()

-- Set configurations needed in Windows. Change the default_domain to the right version of WSL if needed
if wezterm.target_triple == 'x86_64-pc-windows-msvc' then
    -- set ubuntu as default when opening.
    config.default_domain = 'WSL:Ubuntu-22.04'

    -- set powershell as default shell in windows. So that it gives the option to open a new tab in it when right click
    config.default_prog = { 'C:\\Windows\\System32\\WindowsPowerShell\\v1.0\\powershell.exe' }

    -- get rid of title bar in the window
    config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
    config.integrated_title_button_style = "Windows"

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
theme = 'nightfox'

config.color_scheme = theme

-- set tab passive and active background colors based on theme
themeActiveBackground = '#5ae8c2' -- Use the same active color for now
if theme == 'TweakedPandora' then
  themePassiveBackground = '#141e43'
elseif theme == 'Night Owl (Gogh)' then
  themePassiveBackground = '#011627'
elseif theme == 'nightfox' then
  themePassiveBackground = '#192330'
elseif theme == 'Kanagawa (Gogh)' then
  themePassiveBackground = '#1F1F28'
elseif theme == 'kanagawabones' then
  themePassiveBackground = '#1f1f28'
else
  themePassiveBackground = 'black'
end

-- set font
config.font = wezterm.font('Iosevka Nerd Font', { weight = 'Medium' })

-- set font size
config.font_size = 14

-- set opening window size
config.initial_rows = 30
config.initial_cols = 110


-- shut annoying sound off
config.audible_bell = "Disabled"

-- Format tabs
-- config.tab_bar_at_bottom = false
-- config.use_fancy_tab_bar = false

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#141e43'
    -- local background = '#141e43' -- este hay que cambiarlo
    local background = themePassiveBackground -- este hay que cambiarlo
    local foreground = '#808080'

    if tab.is_active then
      background = themeActiveBackground
      foreground = 'black'
    elseif hover then
      background = '#3b3052'
      foreground = '#909090'
    end

    local edge_foreground = background

   -- tab title
    local title = "🦇"
    local SOLID_RIGHT_ARROW = utf8.char(0xe0b0)

    return {
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      -- { Text = " " },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = " " .. (tab.tab_index + 1) .. ": " .. title .. " " },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      -- { Text = "" },
      -- { Text = SOLID_RIGHT_ARROW },
    }
  end
)



-- return the configuration to wezterm
return config
