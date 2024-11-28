-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- Notification wezterm
wezterm.on('window-config-reloaded', function(window, pane)
    wezterm.log_info 'the config was reloaded for this window!'
end)

-- This table will hold the configuration.
local config = {}

-- In newer versions of wezterm, use the config_builder which will
-- help provide clearer error messages
if wezterm.config_builder then
    config = wezterm.config_builder()
end

----------------------------------------------------------
-- This is where you actually apply your config choices --
----------------------------------------------------------

config.default_prog = { '/bin/zsh', '-l' }

-- Color scheme
-- config.color_scheme = 'iceberg-dark'

-- Font
-- config.font = wezterm.font("HackGen", {weight="Medium", stretch="Normal", style="Normal"})
-- config.font_size = 12

-- Background
config.window_background_opacity = 0.75
config.macos_window_background_blur = 20

-- Tabbar
config.use_fancy_tab_bar = false
config.enable_wayland = false -- Waylandサポート無効（Mac）

-- formating title in tabbar
wezterm.on('format-tab-title', function(tab, tabs, panes, config, hover, max_width)
    local process_name = tab.active_pane.foreground_process_name:match("[^/]+$") or "N/A"
    local cwd = tab.active_pane.current_working_dir
    local short_cwd = cwd and cwd:match("[^/]+$") or "No Dir"
    return string.format(" %s | %s ", process_name, short_cwd)
end)

-- Scrollbar
config.scrollback_lines = 10000 -- デフォルトの行数を増やす
config.enable_scroll_bar = true -- スクロールバーを表示

-- Pane
-- アクティブペインと非アクティブペインを視覚的に区別（彩度、明度）
config.inactive_pane_hsb = { saturation = 0.5, brightness = 0.4 }

-- wezterm shell/pane defoult split
-- -> horizontal: Alt + Ctrl + Shift + "
-- -> vertical  : Alt + Ctrl + Shift + %
-- -> new shell : Cmd + t
-- -> move shell: Ctrl + Tab
local act = wezterm.action
config.keys = {
    -- ペイン間分割
    { key = 't', mods = 'CMD|SHIFT', action = act.SplitHorizontal { domain = 'CurrentPaneDomain' } },
    -- ペイン間移動
    { key = 'Tab', mods = 'CTRL|SHIFT', action = act.ActivatePaneDirection 'Next' },
}


-- And finally, return the configuration to wezterm
return config
