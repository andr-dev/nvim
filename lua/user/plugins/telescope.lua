local status_ok, telescope = pcall(require, "telescope")
if not status_ok then
  error("could not pcall telescope")
  return
end

local actions = require "telescope.actions"

local icons = require("user.icons")

telescope.setup {
  defaults = {
    prompt_prefix = icons.ui.Telescope .. " ",
    selection_caret = "  ",
    -- selection_caret = icons.ui.TelescopeSelect .. " ",
    path_display = { "smart" },

    mappings = {
      n = {
        ["<leader>e"] = actions.close,
      },
    },
  },
}

