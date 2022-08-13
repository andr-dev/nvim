local status_ok, lualine = pcall(require, "lualine")
if not status_ok then
  error("could not pcall lualine")
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require "user.icons"

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
  "mode",
  fmt = function(str)
    return "-- " .. str .. " --"
  end,
}

local filetype = {
  "filetype",
  icons_enabled = false,
  icon = nil,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "▔▔", "🮂 ", "🮃 ", "▀▀", "🮄 ", "🮅 ", "🮆 ", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_buf_get_option(0, "shiftwidth")
end

local theme_ok, theme = pcall(require, "user.theme")
if not status_ok then
  error("could not pcall user.theme")
  return
end

lualine.setup {
  options = {
    globalstatus = true,
    icons_enabled = true,
    theme = {
      normal = {
        a = { fg = theme.fg0, bg = theme.blue },
        b = { fg = theme.blue, bg = theme.bg2 },
        c = { fg = theme.fg1, bg = theme.bg2 },
      },
      insert = {
        a = { fg = theme.fg0, bg = theme.green },
        b = { fg = theme.green, bg = theme.bg2 },
      },
      visual = {
        a = { fg = theme.fg0, bg = theme.dark_yellow },
        b = { fg = theme.dark_yellow, bg = theme.bg2 },
      },
      replace = {
        a = { fg = theme.fg0, bg = theme.red },
        b = { fg = theme.red, bg = theme.bg2 },
      },
    },
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = { "alpha", "dashboard", "toggleterm" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { "mode", branch },
    lualine_b = { diagnostics },
    lualine_c = { },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}

