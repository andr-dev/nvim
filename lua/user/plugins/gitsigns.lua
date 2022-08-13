local status_ok, gitsigns = pcall(require, "gitsigns")
if not status_ok then
  error("could not pcall gitsigns")
  return
end

gitsigns.setup {
  signs = {
    add = { hl = "GitSignsAdd", text = "▎", numhl = "GitSignsAdd", linehl = "GitSignsAdd" },
    change = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChange", linehl = "GitSignsChange" },
    delete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDelete", linehl = "GitSignsDelete" },
    topdelete = { hl = "GitSignsDelete", text = "▎", numhl = "GitSignsDelete", linehl = "GitSignsDelete" },
    changedelete = { hl = "GitSignsChange", text = "▎", numhl = "GitSignsChange", linehl = "GitSignsChange" },
  },
  signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
  numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
  linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
  word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
  watch_gitdir = {
    interval = 1000,
    follow_files = true,
  },
  attach_to_untracked = true,
  current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
  sign_priority = 6,
  update_debounce = 200,
  status_formatter = nil, -- Use default
  max_file_length = 10000,
  preview_config = {
    -- Options passed to nvim_open_win
    border = "rounded",
    style = "minimal",
    relative = "cursor",
    row = 0,
    col = 1,
  },
}

