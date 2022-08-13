local status_alpha, alpha = pcall(require, "alpha")
if not status_alpha then
  error("could not pcall alpha")
  return
end

local icons = require "user.icons"

local dashboard = require "alpha.themes.dashboard"

dashboard.section.header.val = {
   "                .                                            .",
   "   *   .                  .              .        .   *          .",
   "   .         .                     .       .           .      .        .",
   "   o                             .                   .",
   "       .              .                  .           .",
   "        0     .",
   "               .          .                 ,                ,    ,",
   ".          \\          .                         .",
   "    .      \\   ,",
   " .          o     .                 .                   .            .",
   "   .         \\                 ,             .                .",
   "             #\\##\\#      .                              .        .",
   "           #  #O##\\###                .                        .",
   " .        #*#  #\\##\\###                       .                     ,",
   "      .   ##*#  #\\##\\##               .                     .",
   "    .      ##*#  #o##\\#         .                             ,       .",
   "        .     *#  #\\#     .                    .             .          ,",
   "                    \\          .                         .",
   "____^/\\___^--____/\\____O______________/\\/\\---/\\___________---______________",
   " /\\^   ^  ^    ^                  ^^ ^  '\\ ^          ^       ---",
   "       --           -            --  -      -         ---  __       ^",
   " --  __                      ___--  ^  ^                         --  __"
}

local function button(sc, txt, keybind)
  local b = dashboard.button(sc, txt, keybind)

  b.opts.hl_shortcut = "AlphaShortcut"

  return b
end

dashboard.section.buttons.val = {
  button("n", icons.ui.NewFile .. " New file", ":ene <BAR> startinsert <CR>"),
  button("f", icons.documents.Files .. " Find file", ":Telescope find_files <CR>"),
  button("r", icons.ui.History .. " Recent files", ":Telescope oldfiles <CR>"),
  button("c", icons.ui.Gear .. " Config", ":e ~/.config/nvim/init.lua <CR>"),
  button("q", icons.ui.SignOut .. " Quit", ":qa<CR>"),
}

dashboard.section.footer.val = "andrthesnek"

dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.buttons.opts.hl = "AlphaLabel"
dashboard.section.buttons.opts.hl_shortcut = "AlphaShortcut"
dashboard.section.footer.opts.hl = "AlphaFooter"

dashboard.opts.opts.noautocmd = true

alpha.setup(dashboard.opts)

