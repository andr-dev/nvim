local notify = require('notify')

vim.api.nvim_create_user_command('NVIMHardMode', function()
  notify('Hardmode is enabled!', "info", {
      title = "Hardmode"
  })
end, { nargs = 0 })

for _, mode in ipairs({'n', 'i', 'v'}) do
  for _, key in ipairs({'<Left>', '<Right>', '<Up>', '<Down>', '<PageUp>', '<PageDown>', '<Esc>'}) do
    vim.api.nvim_set_keymap(mode, key, '<CMD>NVIMHardMode<CR>', { noremap = true, silent = true })
  end
end

