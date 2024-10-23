local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    'git',
    'clone',
    '--filter=blob:none',
    'https://github.com/folke/lazy.nvim.git',
    '--branch=stable',
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
  'nvim-lua/plenary.nvim',

  'nvim-treesitter/nvim-treesitter',

  'nvim-telescope/telescope.nvim',
  'preservim/nerdtree',
  'nvim-lualine/lualine.nvim',
  'rcarriga/nvim-notify',

  -- LSP
  {'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'},
  {'neovim/nvim-lspconfig'},
  {'hrsh7th/cmp-nvim-lsp'},
  {'hrsh7th/nvim-cmp'},

  -- Navigation
  'folke/flash.nvim',

  -- Git
  'ThePrimeagen/git-worktree.nvim',
})

require('user.plugins.hardmode')
require('user.plugins.treesitter')
require('user.plugins.telescope')
require('user.plugins.lualine')
require('user.plugins.lsp')

