local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.keymap.set

--Remap space as leader key
keymap("", ";", "<Nop>", opts)
vim.g.mapleader = ";"
vim.g.maplocalleader = ";"

-- Use ijkl for navigation

keymap("n", "i", "<up>", { noremap = true })
keymap("n", "j", "<left>", { noremap = true })
keymap("n", "k", "<down>", { noremap = true })
keymap("n", "l", "<right>", { noremap = true })

keymap("v", "i", "<up>", { noremap = true })
keymap("v", "j", "<left>", { noremap = true })
keymap("v", "k", "<down>", { noremap = true })
keymap("v", "l", "<right>", { noremap = true })

------------
-- Normal --
------------

-- Better window navigation
keymap("n", "<C-j>", "<C-w>h", opts)
keymap("n", "<C-k>", "<C-w>j", opts)
keymap("n", "<C-i>", "<C-w>k", opts)
keymap("n", "<C-l>", "<C-w>l", opts)

-- Resize with arrows
-- keymap("n", "<C-Up>", ":resize -2<CR>", opts)
-- keymap("n", "<C-Down>", ":resize +2<CR>", opts)
-- keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
-- keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Naviagate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts)
-- keymap("n", "<S-j>", ":bprevious<CR>", opts)

-- Move text up and down
keymap("n", "<A-i>", ":m .-2<CR>==", opts)
keymap("n", "<A-k>", ":m .+1<CR>==", opts)

-- NvimTree
keymap("n", "<leader>e", ":NvimTreeToggle<CR>", opts)

-- Telescope
keymap("n", "<leader>ff", ":Telescope find_files<CR>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<CR>", opts)


-- Comment
keymap("n", "<C-_>", "<CMD>lua require('Comment.api').toggle.linewise.current()<CR>")

------------
-- Insert --
------------

-- Press ,. fast to escape
keymap("i", ",.", "<ESC>", opts)

-- Move text up and down
keymap("i", "<A-i>", "<Esc>:m .-2<CR>==gi", opts)
keymap("i", "<A-k>", "<Esc>:m .+1<CR>==gi", opts)

keymap('i', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle.linewise.current()<CR>')

------------
-- Visual --
------------

-- Stay in indent mode
-- keymap("v", "<", "<gv", opts)
-- keymap("v", ">", ">gv", opts)

-- Move text up and down
-- keymap("v", "<A-k>", ":m '>+1<CR>gv=gv", opts)
-- keymap("v", "<A-i>", ":m '<-2<CR>gv=gv", opts)

-- keymap("n", "<C-/>", "<cmd>lua require('Comment.api').toggle_current_linewise()<CR>", opts)
-- keymap("v", "<C-/>", '<ESC><CMD>lua require("Comment.api").toggle_linewise_op(vim.fn.visualmode())<CR>', opts)

-- Comment
keymap('x', '<C-_>', '<ESC><CMD>lua require("Comment.api").toggle.linewise(vim.fn.visualmode())<CR>')

