local wezterm = require 'wezterm';

local color_scheme = "Catppuccin Macchiato"
-- local color_scheme = "Ayu Mirage"
local colors = wezterm.get_builtin_color_schemes()[color_scheme]

local SOLID_LEFT_ARROW = wezterm.nerdfonts.ple_left_half_circle_thick

local SOLID_RIGHT_ARROW = wezterm.nerdfonts.ple_right_half_circle_thick

-- This function returns the suggested title for a tab.
-- It prefers the title that was set via `tab:set_title()`
-- or `wezterm cli set-tab-title`, but falls back to the
-- title of the active pane in that tab.
local function tab_title(tab_info)
  local title = tab_info.tab_title
  -- if the tab title is explicitly set, take that
  if title and #title > 0 then
    return title
  end
  -- Otherwise, use the title from the active pane
  -- in that tab
  return tab_info.active_pane.title
end

wezterm.on(
  'format-tab-title',
  function(tab, tabs, panes, config, hover, max_width)
    local title = tab_title(tab)

    -- ensure that the titles fit in the available space,
    -- and that we have room for the edges.
    title = wezterm.truncate_right(title, max_width - 2)

    local edge_background = colors.background
    local edge_foreground = colors.ansi[1]
    local background = colors.ansi[1]
    local foreground = colors.ansi[8]

    if tab.is_active then
      edge_background = colors.background
      edge_foreground = colors.background
      background = colors.background
      foreground = colors.brights[8]
    elseif hover then
      edge_background = colors.background
      edge_foreground = colors.brights[8]
      background = colors.background
      foreground = colors.brights[8]
    end

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
  end
)

local config = {
  adjust_window_size_when_changing_font_size = false,
  font = wezterm.font_with_fallback({
    "Iosevka Nerd Font Mono",
    -- "JetbrainsMono Nerd Font",
  }),
  -- window_background_opacity = 0.90,
  window_decorations = "RESIZE",
  macos_window_background_blur = 40,
  hide_tab_bar_if_only_one_tab = false,
  font_size = 18,
  default_prog = { "/usr/bin/arch", "-arm64", "/opt/homebrew/bin/fish" },
  -- color_scheme = "Ayu Mirage",
  -- color_scheme = "Overnight Slumber",
  -- color_scheme = "GitHub Dark",
  color_scheme = color_scheme,
  window_padding = {
    top = 15,
    bottom = 15,
  },
  use_fancy_tab_bar = false,
  tab_bar_at_bottom = true,
  colors = {
    tab_bar = {
      background = colors.background,
      active_tab = {
        bg_color = colors.background,
        fg_color = colors.brights[8],
        intensity = "Bold"
      },
      inactive_tab = {
        bg_color = colors.ansi[1],
        fg_color = colors.ansi[8],
      },
      inactive_tab_hover = {
        bg_color = colors.background,
        fg_color = colors.brights[8],
      },
      new_tab = {
        bg_color = colors.ansi[1],
        fg_color = colors.ansi[8],
      },
      new_tab_hover = {
        bg_color = colors.background,
        fg_color = colors.brights[8],
      }
    }
  },
  -- scrollback_lines = 1000000
  command_palette_font_size = 17,
  command_palette_bg_color = colors.ansi[1],
}

return config
