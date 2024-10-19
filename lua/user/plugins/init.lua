local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end

vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  "nvim-lua/plenary.nvim",

  "nvim-treesitter/nvim-treesitter",

  "nvim-telescope/telescope.nvim",
  "preservim/nerdtree",
  "nvim-lualine/lualine.nvim",
})

require("user.plugins.hardmode")
require("user.plugins.treesitter")
require("user.plugins.telescope")
require("user.plugins.lualine")

