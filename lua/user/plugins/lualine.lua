local status_ok, theme = pcall(require, "user.theme")
if not status_ok then
  vim.notify("Lualine config failed to load theme!")
  return
end

local lualine_theme = theme.lualine()
local lualine_buffers_theme = theme.lualine_buffers()

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = lualine_theme,
    component_separators = '|',
    section_separators = '',
    disabled_filetypes = { 'nerdtree' },
    disabled_buftypes = { 'quickfix', 'prompt' },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },
  sections = {
    lualine_a = {
      {
        'buffers',
        buffers_color = lualine_buffers_theme,
      }
    },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding'},
    lualine_y = {},
    lualine_z = {'location'}
  },
  inactive_sections = {
    lualine_a = {
      {
        'buffers',
        buffers_color = lualine_buffers_theme,
      }
    },
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {'filename'},
    lualine_x = {'encoding'},
    lualine_y = {},
    lualine_z = {'location'}
  },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}

