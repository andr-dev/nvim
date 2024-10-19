vim.api.nvim_create_user_command('NVIMHardMode', function()
  local message = "NVIM hardmode is enabled!"

  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 1, -1, false, {"  " .. message})
  vim.api.nvim_buf_set_option(buf, 'buftype', 'nofile')
  vim.api.nvim_buf_set_option(buf, 'bufhidden', 'wipe')
  vim.api.nvim_buf_set_option(buf, 'swapfile', false)
  vim.api.nvim_buf_set_option(buf, 'modifiable', false)
  vim.api.nvim_buf_set_option(buf, 'readonly', true)

  local opts = {
    relative = 'editor',
    width = string.len(message) + 4,
    height = 3,
    row = math.floor((vim.o.lines - 3) / 2),
    col = math.floor((vim.o.columns - (string.len(message) + 4)) / 2),
    anchor = 'NW',
    style = 'minimal',
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, true, opts)
end, { nargs = 0 })

for _, mode in ipairs({'n', 'i', 'v'}) do
  for _, key in ipairs({'<Left>', '<Right>', '<Up>', '<Down>', '<PageUp>', '<PageDown>', '<Esc>'}) do
    vim.api.nvim_set_keymap(mode, key, '<Esc>[[:NVIMHardMode<CR>]]', { noremap = true, silent = true })
  end
end

