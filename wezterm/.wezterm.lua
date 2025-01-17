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
-- config.use_fancy_tab_bar = false
config.tab_bar_at_bottom = true -- Tabbar下方設置
-- config.enable_wayland = false -- Waylandサポート無効（Mac）
-- config.window_decorations = "RESIZE" -- タイトルバー除去
config.hide_tab_bar_if_only_one_tab = true -- タブが一つなら非表示

-- タブバーの形状と透過
config.window_frame = {
    inactive_titlebar_bg = "none",
    active_titlebar_bg = "none",
}
config.window_background_gradient = {
    colors = { "#000" },
}
config.show_new_tab_button_in_tab_bar = false --[+]ボタン除去
-- config.show_close_tab_button_in_tabs = false --[×]ボタン除去
config.colors = {
    tab_bar = {
        inactive_tab_edge = "none",
    },
}

-- formating title in tabbar
local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_lower_right_triangle
local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_upper_left_triangle

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
    local background = "#6b7089"
    local foreground = "#aaa"
    local edge_background = "none"

    if tab.is_active then
        background = "#84a0c6"
        foreground = "#fff"
    end

    local edge_foreground = background
    local title = "   " .. wezterm.truncate_right(tab.active_pane.title, max_width - 2) .. "   "

    return {
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_LEFT_ARROW },
        { Background = { Color = background } },
        { Foreground = { Color = foreground } },
        { Text = title },
        { Background = { Color = edge_background } },
        { Foreground = { Color = edge_foreground } },
        { Text = SOLID_RIGHT_ARROW },
    }
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
