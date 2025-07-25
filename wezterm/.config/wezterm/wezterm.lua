local w = require 'utils/wallpaper'
local b = require 'utils/background'
local k = require("utils/keys")

local wezterm = require("wezterm")
local act = wezterm.action


return {
  -- background = {
  --     w.get_wallpaper(),
  --     b.get_background(),
  -- },

  -- color_scheme = 'Catppuccin Mocha',
  color_scheme = 'gruvbox_material_dark_medium',
  color_schemes = {
    ["gruvbox_material_dark_hard"] = {
      foreground = "#D4BE98",
      background = "#1D2021",
      cursor_bg = "#D4BE98",
      cursor_border = "#D4BE98",
      cursor_fg = "#1D2021",
      selection_bg = "#D4BE98",
      selection_fg = "#3C3836",

      ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
      brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
    },
    ["gruvbox_material_light_hard"] = {
      foreground = "#654735",
      background = "#F9F5D7",
      cursor_bg = "#654735",
      cursor_border = "#654735",
      cursor_fg = "#F9F5D7",
      selection_bg = "#F3EAC7",
      selection_fg = "#4F3829",

      ansi = { "#1d2021", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
      brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" }
    },
    ["gruvbox_material_dark_medium"] = {
      foreground = "#D4BE98",
      background = "#282828",
      cursor_bg = "#D4BE98",
      cursor_border = "#D4BE98",
      cursor_fg = "#282828",
      selection_bg = "#D4BE98",
      selection_fg = "#45403d",

      ansi = { "#282828", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
      brights = { "#eddeb5", "#ea6962", "#a9b665", "#d8a657", "#7daea3", "#d3869b", "#89b482", "#d4be98" },
    },
  },
  font_size = 16.0,
  macos_window_background_blur = 19,
  window_background_opacity = 1.0,
  -- window_padding = {
  --     left = 30,
  --     right = 30,
  --     top = 20,
  --     bottom = 10,
  -- },
  enable_tab_bar = false,
  window_close_confirmation = 'NeverPrompt',
  window_decorations = 'RESIZE',
  keys = {
    k.cmd_key(
      "R",
      act.Multiple({
        act.SendKey({ key = "\x1b" }), -- escape
        k.multiple_actions(":source %"),
      })
    ),
  },
}
