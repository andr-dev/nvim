local status_ok, indent_blankline = pcall(require, "indent_blankline")
if not status_ok then
  error("could not pcall indent_blankline")
  return
end

vim.g.indent_blankline_context_patterns = {
  "class",
  "return",
  "function",
  "method",
  "^if",
  "^while",
  "jsx_element",
  "^for",
  "^object",
  "^table",
  "block",
  "arguments",
  "if_statement",
  "else_clause",
  "jsx_element",
  "jsx_self_closing_element",
  "try_statement",
  "catch_clause",
  "import_statement",
  "operation_type",
}

indent_blankline.setup {
  char = "▏",
  filetype_exclude = {
    "alpha",
    "help",
    "dashboard",
    "packer",
    "neogitstatus",
    "NvimTree",
    "lspinfo",
    "lsp-installer",
    "mason"
  },
  buftype_exclude = { "terminal", "nofile" },
  show_trailing_blankline_indent = false,
  show_first_indent_level = true,
  use_treesitter = false,
  show_current_context = true,
  show_current_context = true,
  show_current_context_start = true,
}
