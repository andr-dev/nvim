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

set_keymap('v', 'J', ":m '>+1<CR>gv=gv")
set_keymap('v', 'K', ":m '<-2<CR>gv=gv")

set_keymap('n', '<C-d>', '<C-d>zz')
set_keymap('n', '<C-u>', '<C-u>zz')

set_keymap('n', 'n', 'nzzzv')
set_keymap('n', 'N', 'Nzzzv')

set_keymap('x', '<leader>p', '\"_dP')

set_keymap('n', 'Q', '<nop>')

-- Buffers
set_keymap('n', '<leader>bn', ':bnext<CR>')
set_keymap('n', '<leader>bp', ':bprev<CR>')

-- Telescope
set_keymap('n', '<leader>ff', '<cmd>Telescope find_files<cr>')
set_keymap('n', '<leader>fg', '<cmd>Telescope live_grep<cr>')
set_keymap('n', '<leader>fb', '<cmd>Telescope buffers<cr>')
set_keymap('n', '<leader>fh', '<cmd>Telescope help_tags<cr>')

-- NERDTree
set_keymap('n', '<leader>tt', ':NERDTreeToggle<CR>')
set_keymap('n', '<leader>tf', ':NERDTreeFocus<CR>')

-- Navigation
set_keymap('n', 's', '<CMD>lua require("flash").jump()<CR>')

-- Git
set_keymap('n', '<leader>gwc', '<CMD>lua require("telescope").extensions.git_worktree.create_git_worktree()<CR>')
set_keymap('n', '<leader>gws', '<CMD>lua require("telescope").extensions.git_worktree.git_worktrees()<CR>')

