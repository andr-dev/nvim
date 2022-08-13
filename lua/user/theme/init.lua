local colorscheme = "gruvcrate"

local status_ok, theme = pcall(require, "user.theme." .. colorscheme)
if not status_ok then
  vim.notify("Colorscheme " .. colorscheme .. " not found!")
  return
end

return theme
