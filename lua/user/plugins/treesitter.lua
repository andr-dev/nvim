local status_ok, configs = pcall(require, "nvim-treesitter.configs")
if not status_ok then
	error("could not pcall nvim-treesitter.configs")
  return
end

configs.setup {
	ensure_installed = { "lua", "rust" }, -- one of "all" or a list of languages
	sync_install = false, -- install languages synchronously (only applied to `ensure_installed`)
	ignore_install = { "" }, -- List of parsers to ignore installing
	matchup = {
		enable = true, -- mandatory, false will disable the whole extension
		disable_virtual_text = true,
	},
	highlight = {
		enable = true, -- false will disable the whole extension
		disable = { "markdown" }, -- list of language that will be disabled
	},
	autopairs = {
		enable = true,
	},
	indent = { enable = true, disable = { "python", "css", "rust" } },
	context_commentstring = {
		enable = true,
		enable_autocmd = false,
	},
	autotag = {
		enable = true,
		disable = { "xml", "markdown" },
	},
	rainbow = {
		enable = true,
		colors = {
			"Gold",
			"Orchid",
			"DodgerBlue",
			-- "Cornsilk",
			-- "Salmon",
			-- "LawnGreen",
		},
		disable = { "html" },
	},
	-- https://github.com/ChristianChiarulli/nvim/blob/master/lua/user/treesitter.lua for more options
}

