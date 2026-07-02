local wezterm = require 'wezterm'
local config = wezterm.config_builder()
local act = wezterm.action

-- This is where you actually apply your config choices.
config.font = wezterm.font 'JetBrains Mono'

wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
  local pane = tab.active_pane
  local process = pane.foreground_process_name

  local name = process and process:match('([^/\\]+)$') or 'wezterm'
  local index = tab.tab_index + 1

  return string.format('%d: %s', index, name)
end)


config.keys = {
    { key = "1", mods = "ALT", action = act.ActivateTab(0) },
    { key = "2", mods = "ALT", action = act.ActivateTab(1) },
    { key = "3", mods = "ALT", action = act.ActivateTab(2) },
    { key = "4", mods = "ALT", action = act.ActivateTab(3) },
    { key = "5", mods = "ALT", action = act.ActivateTab(4) },
    { key = "6", mods = "ALT", action = act.ActivateTab(5) },
    { key = "7", mods = "ALT", action = act.ActivateTab(6) },
    { key = "8", mods = "ALT", action = act.ActivateTab(7) },
    { key = "9", mods = "ALT", action = act.ActivateTab(-1) }, -- last tab
    { key = 'UpArrow', mods = 'SHIFT', action = act.ScrollByLine(-1) },
    { key = 'DownArrow', mods = 'SHIFT', action = act.ScrollByLine(1) },
    { key = "LeftArrow", mods = "CTRL", action = act.ScrollToTop },
}

config.color_scheme = 'iceberg-dark'
config.tab_bar_at_bottom = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.window_decorations = "RESIZE"

config.colors = {
  tab_bar = {
    active_tab = {
      bg_color = "#333333",
      fg_color = "#5eacd3",
    },

    inactive_tab = {
      bg_color = "#333333",
      fg_color = "#ffffff",
    },

    inactive_tab_hover = {
      bg_color = "#333333",
      fg_color = "#5eacd3",
    },

    new_tab = {
      bg_color = "#333333",
      fg_color = "#5eacd3",
    },

    new_tab_hover = {
      bg_color = "#333333",
      fg_color = "#5eacd3",
    },
  },
}

-- Finally, return the configuration to wezterm:
return config
