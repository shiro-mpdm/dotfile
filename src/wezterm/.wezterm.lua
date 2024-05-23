-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Notification wezterm
wezterm.on('window-config-reloaded', function(window, pane)
  wezterm.log_info 'the config was reloaded for this window!'
end)

-- 
local act = wezterm.action
config.keys = {
  -- Alt(Opt)+Shift+Fでフルスクリーン切り替え
  {
    key = 'f',
    mods = 'SHIFT|META',
    action = wezterm.action.ToggleFullScreen,
  },
  -- Ctrl+Shift+tで新しいタブを作成
  {
    key = 't',
    mods = 'SHIFT|CTRL',
    action = act.SpawnTab 'CurrentPaneDomain',
  },
  -- Ctrl+Shift+dで新しいペインを作成(画面を分割)
  {
    key = 'd',
    mods = 'SHIFT|CTRL',
    action = wezterm.action.SplitHorizontal { domain = 'CurrentPaneDomain' },
  },
}

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
  config = wezterm.config_builder()
end

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
config.color_scheme = 'iceberg-dark'

-- background
config.window_background_opacity = 0.85
config.macos_window_background_blur = 15

-- font
config.font = wezterm.font("MonaspiceAr Nerd Font Mono", {weight="Medium", stretch="Normal", style="Normal"})
config.font_size = 14

-- and finally, return the configuration to wezterm
return config
