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
    selection_caret = " ",
    path_display = { "smart" },

    mappings = {
      i = {
        ["<C-j>"] = actions.move_selection_next,
        ["<Down>"] = actions.move_selection_next,

        ["<C-k>"] = actions.move_selection_previous,
        ["<Up>"] = actions.move_selection_previous,

        ["<C-c>"] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
      },

      n = {
        ["j"] = actions.move_selection_next,
        ["<Down>"] = actions.move_selection_next,

        ["k"] = actions.move_selection_previous,
        ["<Up>"] = actions.move_selection_previous,

        ["<esc>"] = actions.close,

        ["<CR>"] = actions.select_default,
        ["<C-h>"] = actions.select_horizontal,
        ["<C-v>"] = actions.select_vertical,
        ["<C-t>"] = actions.select_tab,

        ["<PageUp>"] = actions.results_scrolling_up,
        ["<PageDown>"] = actions.results_scrolling_down,
      },
    },
  },
}

