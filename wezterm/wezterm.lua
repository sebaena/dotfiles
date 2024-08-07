-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- hold the configuration.
local config = wezterm.config_builder()

-- set ubuntu as default when opening. Comment this if using linux
config.default_domain = 'WSL:Ubuntu-22.04'

-- set color scheme
config.color_scheme = 'TweakedPandora'

-- set font
config.font = wezterm.font('Iosevka Nerd Font', { weight = 'Medium' })

-- set font size
config.font_size = 14

-- set opening window size
config.initial_rows = 30
config.initial_cols = 110

-- get rid of title bar in the window
config.window_decorations = "INTEGRATED_BUTTONS|RESIZE"
config.integrated_title_button_style = "Windows"

-- shut annoying sound off
config.audible_bell = "Disabled"

-- Format tabs
config.tab_bar_at_bottom = false
config.use_fancy_tab_bar = false

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local edge_background = '#141e43'
    local background = '#141e43'
    local foreground = '#808080'

    if tab.is_active then
      background = '#5ae8c2'
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
      { Text = " " },
      { Background = { Color = background } },
      { Foreground = { Color = foreground } },
      { Text = " " .. (tab.tab_index + 1) .. ": " .. title .. " " },
      { Background = { Color = edge_background } },
      { Foreground = { Color = edge_foreground } },
      { Text = "" },
      -- { Text = SOLID_RIGHT_ARROW },
    }
  end
)

-- return the configuration to wezterm
return config
