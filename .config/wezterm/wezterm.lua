-- Pull in the wezterm API
local wezterm = require 'wezterm'

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices

-- For example, changing the color scheme:
-- config.color_scheme = 'Tokyo Night'
config.color_scheme = 'Nord (Gogh)'
-- config.color_scheme = 'Andromeda'

config.font_size = 15
-- config.font = wezterm.font('Fira Code', { weight = 'Bold', italic = true })
config.font = wezterm.font("Operator Mono", {weight="Bold", stretch="Normal", style="Normal"})

config.window_padding = {
    left = 32,
    right = 32,
    top = 10,
    bottom = 10
}

config.colors = {
    tab_bar = {
        -- background = "#1E1E1E", -- VS Code Dark Theme background
        background = "#2c3e50", -- VS Code Dark Theme background
        active_tab = {
            bg_color = "#007ACC", -- VS Code Blue Highlight
            fg_color = "#FFFFFF",
            intensity = "Bold",
            italic = false,
            underline = "None",
        },
        inactive_tab = {
            -- bg_color = "#252526",
            bg_color = "#",
            fg_color = "#D4D4D4",
        },
        inactive_tab_hover = {
            bg_color = "#3E3E3E",
            fg_color = "#FFFFFF",
            italic = false,
        },
        new_tab = {
            -- bg_color = "#252526",
            bg_color = "#34495e",
            fg_color = "#AAAAAA",
        },
        new_tab_hover = {
            bg_color = "#3E3E3E",
            fg_color = "#FFFFFF",
        },
    },
}

config.enable_tab_bar = true
config.tab_bar_at_bottom = false
config.hide_tab_bar_if_only_one_tab = false
-- config.tab_bar_at_bottom = false -- Set to true if you want it at the bottom
config.use_fancy_tab_bar = false -- VS Code has a simpler bar

config.tab_max_width = 29

config.window_background_opacity = 0.7
config. window_frame = {
    font_size = 14.0, -- Increase for bigger text in the tab bar
    -- active_titlebar_bg = "#1E1E1E",
    -- inactive_titlebar_bg = "#1E1E1E"
    active_titlebar_bg = "#34495e",
    inactive_titlebar_bg = "#34495e"
}

-- and finally, return the configuration to wezterm
return config