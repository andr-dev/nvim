local function set_keymap(mode, key, command, opts)
  local options = vim.tbl_deep_extend("force", { noremap = true, silent = true }, opts or {})
  vim.keymap.set(mode, key, command, options)
end

set_keymap('n', '<leader>e', '<Esc>')
set_keymap('i', '<leader>e', '<Esc>')
set_keymap('v', '<leader>e', '<Esc>')

-- Window Management
set_keymap('n', '<leader>sv', '<C-w>v')
set_keymap('n', '<leader>sh', '<C-w>s')
set_keymap('n', '<leader>s=', '<C-w>=')

-- Telescope
set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- NERDTree
set_keymap('n', '<leader>tt', ':NERDTreeToggle<CR>')
set_keymap('n', '<leader>tf', ':NERDTreeFocus<CR>')

