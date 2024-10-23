local gruvcrate = {
  black           = "#000000",
  bg0             = "#1C1B1E",
  bg1             = "#333235",
  bg2             = "#49494B",
  bg4             = "#777678",
  fg0             = "#E8E8E9",
  fg1             = "#D2D1D2",
  dark_red        = "#cc241d",
  red             = "#fb4934",
  dark_green      = "#89b46c",
  green           = "#89b46c",
  dark_yellow     = "#d79921",
  yellow          = "#f9bf58",
  dark_blue       = "#415667",
  blue            = "#73a1a9",
  dark_purple     = "#b16286",
  purple          = "#d3869b",
  dark_cyan       = "#537c7d",
  cyan            = "#689b9d",
  none            = "NONE"
}

function gruvcrate.terminal_color()
  vim.g.terminal_color_0  = gruvcrate.bg0
  vim.g.terminal_color_1  = gruvcrate.dark_red
  vim.g.terminal_color_2  = gruvcrate.dark_green
  vim.g.terminal_color_3  = gruvcrate.dark_yellow
  vim.g.terminal_color_4  = gruvcrate.dark_blue
  vim.g.terminal_color_5  = gruvcrate.dark_purple
  vim.g.terminal_color_6  = gruvcrate.dark_cyan
  vim.g.terminal_color_7  = gruvcrate.fg1
  vim.g.terminal_color_8  = gruvcrate.bg4
  vim.g.terminal_color_9  = gruvcrate.red
  vim.g.terminal_color_10 = gruvcrate.green
  vim.g.terminal_color_11 = gruvcrate.yellow
  vim.g.terminal_color_12 = gruvcrate.blue
  vim.g.terminal_color_13 = gruvcrate.purple
  vim.g.terminal_color_14 = gruvcrate.cyan
  vim.g.terminal_color_15 = gruvcrate.fg0
end

function gruvcrate.lualine()
  return {
    normal = {
      a = { fg = gruvcrate.fg1, bg = gruvcrate.bg4, gui = 'bold' },
      b = { fg = gruvcrate.fg0, bg = gruvcrate.bg2 },
      c = { fg = gruvcrate.fg0, bg = gruvcrate.bg1 },
    },
    insert = {
      a = { fg = gruvcrate.fg1, bg = gruvcrate.dark_red, gui = 'bold' },
      b = { fg = gruvcrate.fg0, bg = gruvcrate.bg2 },
      c = { fg = gruvcrate.fg0, bg = gruvcrate.bg1 },
    },
    visual = {
      a = { fg = gruvcrate.fg1, bg = gruvcrate.dark_yellow, gui = 'bold' },
      b = { fg = gruvcrate.fg0, bg = gruvcrate.bg2 },
      c = { fg = gruvcrate.fg0, bg = gruvcrate.bg1 },
    },
    replace = {
      a = { fg = gruvcrate.fg1, bg = gruvcrate.dark_purple, gui = 'bold' },
      b = { fg = gruvcrate.fg0, bg = gruvcrate.bg2 },
      c = { fg = gruvcrate.fg0, bg = gruvcrate.bg1 },
    },
    inactive = {
      a = { fg = gruvcrate.fg0, bg = gruvcrate.bg4, gui = 'bold' },
      b = { fg = gruvcrate.fg0, bg = gruvcrate.bg2 },
      c = { fg = gruvcrate.fg0, bg = gruvcrate.bg1 },
    },
  }
end

function gruvcrate.lualine_buffers()
  return {
    active   = { fg = gruvcrate.fg0, bg = gruvcrate.blue, gui = 'bold' },
    inactive = { fg = gruvcrate.fg1, bg = gruvcrate.bg4 },
  }
end

function gruvcrate.highlight(group, color)
  local style = color.style and 'gui=' .. color.style or 'gui=NONE'
  local fg = color.fg and 'guifg=' .. color.fg or 'guifg=NONE'
  local bg = color.bg and 'guibg=' .. color.bg or 'guibg=NONE'
  local sp = color.sp and 'guisp=' .. color.sp or ''
  vim.api.nvim_command('highlight ' .. group .. ' ' .. style .. ' ' .. fg ..' ' .. bg..' '..sp)
end

function gruvcrate.load_syntax()
  local syntax = {
    -- common
    Normal                          = {fg = gruvcrate.fg1, bg = gruvcrate.bg0},
    Terminal                        = {fg = gruvcrate.fg1, bg = gruvcrate.bg0},
    EndOfBuffer                     = {fg = gruvcrate.bg0},
    FoldColumn                      = {fg = gruvcrate.fg1, bg = gruvcrate.bg1},
    Folded                          = {fg = gruvcrate.fg1, bg = gruvcrate.bg1},
    SignColumn                      = {fg = gruvcrate.fg1, bg = gruvcrate.bg0},
    ToolbarLine                     = {fg = gruvcrate.fg1},
    Cursor                          = {bg = gruvcrate.blue},
    vCursor                         = {reverse = true},
    iCursor                         = {bg = gruvcrate.blue},
    lCursor                         = {reverse = true},
    CursorIM                        = {reverse = true},
    CursorColumn                    = {bg = gruvcrate.bg1},
    CursorLine                      = {bg = gruvcrate.bg1},
    ColorColumn                     = {bg = gruvcrate.bg1},
    CursorLineNr                    = {fg = gruvcrate.fg1},
    LineNr                          = {fg = gruvcrate.bg4},
    Conceal                         = {fg = gruvcrate.bg4, bg = gruvcrate.bg1},
    DiffAdd                         = {fg = gruvcrate.none, bg = gruvcrate.dark_green},
    DiffChange                      = {fg = gruvcrate.none, bg = gruvcrate.dark_yellow},
    DiffDelete                      = {fg = gruvcrate.none, bg = gruvcrate.dark_red},
    DiffText                        = {fg = gruvcrate.none, bg= gruvcrate.dark_blue},
    DiffAdded                       = {fg = gruvcrate.dark_green},
    DiffRemoved                     = {fg = gruvcrate.dark_red},
    DiffFile                        = {fg = gruvcrate.dark_cyan},
    DiffIndexLine                   = {fg = gruvcrate.bg4},
    Directory                       = {fg = gruvcrate.blue},
    ErrorMsg                        = {fg = gruvcrate.red, bold = true, underline = true},
    WarningMsg                      = {fg = gruvcrate.yellow, bold = true},
    MoreMsg                         = {fg = gruvcrate.blue, bold = true},
    IncSearch                       = {fg = gruvcrate.bg0, bg = gruvcrate.fg1},
    Search                          = {fg = gruvcrate.bg0, bg = gruvcrate.fg1},
    Substitute                      = {fg = gruvcrate.bg0, bg = gruvcrate.blue},
    MatchParen                      = {fg = gruvcrate.none, bg = gruvcrate.bg4},
    NonText                         = {fg = gruvcrate.bg4},
    Whitespace                      = {fg = gruvcrate.bg4},
    SpecialKey                      = {fg = gruvcrate.bg4},
    Pmenu                           = {fg = gruvcrate.fg1, bg = gruvcrate.bg1},
    PmenuSbar                       = {fg = gruvcrate.none, bg = gruvcrate.bg1},
    PmenuSel                        = {fg = gruvcrate.bg0, bg = gruvcrate.dark_red},
    WildMenu                        = {fg = gruvcrate.bg0, bg = gruvcrate.blue},
    PmenuThumb                      = {fg = gruvcrate.none, bg = gruvcrate.bg4},
    Question                        = {fg = gruvcrate.yellow},
    SpellBad                        = {fg = gruvcrate.red, underline = true, sp = gruvcrate.red},
    SpellCap                        = {fg = gruvcrate.yellow, underline = true, sp = gruvcrate.yellow},
    SpellLocal                      = {fg = gruvcrate.blue, underline = true, sp = gruvcrate.blue},
    SpellRare                       = {fg = gruvcrate.purple, underline = true, sp = gruvcrate.purple},
    StatusLine                      = {fg = gruvcrate.fg1, bg = gruvcrate.bg2},
    StatusLineTerm                  = {fg = gruvcrate.fg1, bg = gruvcrate.bg2},
    StatusLineNC                    = {fg = gruvcrate.bg4, bg = gruvcrate.bg1},
    StatusLineTermNC                = {fg = gruvcrate.bg4, bg = gruvcrate.bg1},
    TabLine                         = {fg = gruvcrate.fg1, bg = gruvcrate.bg1},
    TabLineFill                     = {fg = gruvcrate.bg4, bg = gruvcrate.bg1},
    TabLineSel                      = {fg = gruvcrate.bg4, bg = gruvcrate.bg1},
    VertSplit                       = {fg = gruvcrate.bg1},
    Visual                          = {bg = gruvcrate.bg2},
    VisualNOS                       = {fg = gruvcrate.none, bg = gruvcrate.bg2, underline = true},
    QuickFixLine                    = {fg = gruvcrate.blue, underline = true},
    Debug                           = {fg = gruvcrate.yellow},
    debugPC                         = {fg = gruvcrate.bg0, bg = gruvcrate.green},
    debugBreakpoint                 = {fg = gruvcrate.bg0, bg = gruvcrate.red},
    ToolbarButton                   = {fg = gruvcrate.bg0, bg = gruvcrate.blue},

    -- syntax
    String                          = {fg = gruvcrate.green},
    Character                       = {fg = gruvcrate.green},
    Number                          = {fg = gruvcrate.yellow},
    Float                           = {fg = gruvcrate.yellow},
    Boolean                         = {fg = gruvcrate.yellow},
    Type                            = {fg = gruvcrate.yellow},
    Structure                       = {fg = gruvcrate.yellow},
    StorageClass                    = {fg = gruvcrate.yellow},
    Identifier                      = {fg = gruvcrate.blue},
    Constant                        = {fg = gruvcrate.cyan},
    PreProc                         = {fg = gruvcrate.red},
    PreCondit                       = {fg = gruvcrate.red},
    Include                         = {fg = gruvcrate.red},
    Keyword                         = {fg = gruvcrate.red},
    Define                          = {fg = gruvcrate.red},
    Typedef                         = {fg = gruvcrate.red},
    Exception                       = {fg = gruvcrate.red},
    Conditional                     = {fg = gruvcrate.red},
    Repeat                          = {fg = gruvcrate.red},
    Statement                       = {fg = gruvcrate.red},
    Macro                           = {fg = gruvcrate.aqua},
    Error                           = {fg = gruvcrate.red},
    Label                           = {fg = gruvcrate.cyan},
    Special                         = {fg = gruvcrate.yellow},
    SpecialChar                     = {fg = gruvcrate.yellow},
    Function                        = {fg = gruvcrate.blue},
    Operator                        = {fg = gruvcrate.fg1},
    Title                           = {fg = gruvcrate.cyan},
    Tag                             = {fg = gruvcrate.green},
    Delimiter                       = {fg = gruvcrate.fg1},
    Comment                         = {fg = gruvcrate.bg4},
    SpecialComment                  = {fg = gruvcrate.aqua},
    Todo                            = {fg = gruvcrate.aqua},
  }
  return syntax
end

function gruvcrate.load_plugins()
  local syntax = {
    -- Tree Sitter
    TSAnnotation                    = {fg = gruvcrate.purple},
    TSAttribute                     = {fg = gruvcrate.fg1},
    TSBoolean                       = {fg = gruvcrate.purple},
    TSCharacter                     = {fg = gruvcrate.aqua},
    TSComment                       = {fg = gruvcrate.bg4},
    TSConditional                   = {fg = gruvcrate.red},
    TSConstant                      = {fg = gruvcrate.fg1},
    TSConstBuiltin                  = {fg = gruvcrate.red},
    TSConstMacro                    = {fg = gruvcrate.blue},
    TSConstructor                   = {fg = gruvcrate.fg1},
    TSError                         = {fg = gruvcrate.red},
    TSException                     = {fg = gruvcrate.purple},
    TSField                         = {fg = gruvcrate.blue},
    TSFloat                         = {fg = gruvcrate.purple},
    TSFunction                      = {fg = gruvcrate.blue},
    TSFuncBuiltin                   = {fg = gruvcrate.blue},
    TSFuncMacro                     = {fg = gruvcrate.green},
    TSInclude                       = {fg = gruvcrate.red},
    TSKeyword                       = {fg = gruvcrate.red},
    TSKeywordFunction               = {fg = gruvcrate.red},
    TSKeywordOperator               = {fg = gruvcrate.red},
    TSLabel                         = {fg = gruvcrate.purple},
    TSMethod                        = {fg = gruvcrate.blue},
    TSNamespace                     = {fg = gruvcrate.yellow},
    TSNone                          = {fg = gruvcrate.fg1},
    TSNumber                        = {fg = gruvcrate.purple},
    TSOperator                      = {fg = gruvcrate.fg1},
    TSParameter                     = {fg = gruvcrate.fg1},
    TSParameterReference            = {fg = gruvcrate.fg1},
    TSProperty                      = {fg = gruvcrate.fg1},
    TSPunctDelimiter                = {fg = gruvcrate.fg1},
    TSPunctBracket                  = {fg = gruvcrate.fg1},
    TSPunctSpecial                  = {fg = gruvcrate.blue},
    TSRepeat                        = {fg = gruvcrate.red},
    TSString                        = {fg = gruvcrate.green},
    TSStringRegex                   = {fg = gruvcrate.purple},
    TSStringEscape                  = {fg = gruvcrate.green},
    TSSymbol                        = {fg = gruvcrate.cyan},
    TSTag                           = {fg = gruvcrate.green},
    TSTagDelimiter                  = {fg = gruvcrate.fg1},
    TSText                          = {fg = gruvcrate.fg1},
    TSStrong                        = {fg = gruvcrate.fg1},
    TSEmphasis                      = {fg = gruvcrate.fg1},
    TSUnderline                     = {fg = gruvcrate.fg1},
    TSStrike                        = {fg = gruvcrate.fg1},
    TSTitle                         = {fg = gruvcrate.fg1},
    TSLiteral                       = {fg = gruvcrate.green},
    TSURI                           = {fg = gruvcrate.purple},
    TSMath                          = {fg = gruvcrate.blue},
    TSTextReference                 = {fg = gruvcrate.fg1},
    TSEnviroment                    = {fg = gruvcrate.fg1},
    TSEnviromentName                = {fg = gruvcrate.fg1},
    TSNote                          = {fg = gruvcrate.fg1},
    TSWarning                       = {fg = gruvcrate.dark_yellow},
    TSDanger                        = {fg = gruvcrate.red},
    TSType                          = {fg = gruvcrate.yellow},
    TSTypeBuiltin                   = {fg = gruvcrate.yellow},
    TSVariable                      = {fg = gruvcrate.fg1},
    TSVariableBuiltin               = {fg = gruvcrate.blue},

    -- git signs
    GitSignsAdd                     = {fg = gruvcrate.green},
    GitSignsChange                  = {fg = gruvcrate.dark_yellow},
    GitSignsDelete                  = {fg = gruvcrate.red},

    -- telescope
    TelescopeBorder                 = {fg = gruvcrate.blue},
    TelescopePromptBorder           = {fg = gruvcrate.blue},
    TelescopeResultsBorder          = {fg = gruvcrate.blue},
    TelescopePreviewBorder          = {fg = gruvcrate.blue},
    TelescopePromptPrefix           = {fg = gruvcrate.blue},
    TelescopeSelectionCaret         = {fg = gruvcrate.blue},

    -- nvim tree
    NvimTreeGitDeleted = { fg = gruvcrate.red },
    NvimTreeGitDirty = { fg = gruvcrate.dark_yellow },
    NvimTreeGitNew = { fg = gruvcrate.green },
    NvimTreeImageFile = { fg = gruvcrate.blue },
    NvimTreeIndentMarker = { fg = gruvcrate.fg1 },
    NvimTreeNormal = { fg = gruvcrate.fg1 },
    NvimTreeNormalNC = { fg = gruvcrate.fg1 },
    NvimTreeRootFolder = { fg = gruvcrate.blue },
    NvimTreeSpecialFile = { fg = gruvcrate.blue, style = "underline" },
    NvimTreeSymlink = { fg = gruvcrate.blue },

    -- lsp related
    LspDiagnosticsSignError         = {fg=gruvcrate.red},
    LspDiagnosticsSignWarning       = {fg=gruvcrate.yellow},
    LspDiagnosticsSignInformation   = {fg=gruvcrate.blue},
    LspDiagnosticsSignHint          = {fg=gruvcrate.purple},

    LspDiagnosticsVirtualTextError        = {fg=gruvcrate.red},
    LspDiagnosticsVirtualTextWarning      = {fg=gruvcrate.yellow},
    LspDiagnosticsVirtualTextInformation  = {fg=gruvcrate.blue},
    LspDiagnosticsVirtualTextHint         = {fg=gruvcrate.purple},

    LspDiagnosticsUnderlineError        = {style="undercurl",sp=gruvcrate.red},
    LspDiagnosticsUnderlineWarning      = {style="undercurl",sp=gruvcrate.yellow},
    LspDiagnosticsUnderlineInformation  = {style="undercurl",sp=gruvcrate.blue},
    LspDiagnosticsUnderlineHint         = {style="undercurl",sp=gruvcrate.purple},

    -- alpha
    AlphaHeader   = { fg=gruvcrate.blue },
    AlphaLabel    = { fg=gruvcrate.fg1 },
    AlphaShortcut = { fg=gruvcrate.blue },
    AlphaFooter   = { fg=gruvcrate.fg0 },

    -- Indent Blankline
    IndentBlanklineContextStart = {},
    IndentBlanklineContextChar = { fg=gruvcrate.bg4 },
    IndentBlanklineSpaceCharBlankline = {},
    IndentBlanklineSpaceChar = {},
    IndentBlanklineChar = { fg=gruvcrate.bg2 },

    -- markdown
    markdownBlockquote            = {fg = gruvcrate.bg4},
    markdownBold                  = {fg = gruvcrate.none, bold = true},
    markdownBoldDelimiter         = {fg = gruvcrate.red},
    markdownCode                  = {fg = gruvcrate.green},
    markdownCodeBlock             = {fg = gruvcrate.green},
    markdownCodeDelimiter         = {fg = gruvcrate.yellow},
    markdownH1                    = {fg = gruvcrate.dark_yellow, bold = true},
    markdownH2                    = {fg = gruvcrate.dark_yellow, bold = true},
    markdownH3                    = {fg = gruvcrate.dark_yellow, bold = true},
    markdownH4                    = {fg = gruvcrate.dark_yellow, bold = true},
    markdownH5                    = {fg = gruvcrate.dark_yellow, bold = true},
    markdownH6                    = {fg = gruvcrate.dark_yellow, bold = true},
    markdownHeadingDelimiter      = {fg = gruvcrate.bg4},
    markdownId                    = {fg = gruvcrate.yellow},
    markdownIdDeclaration         = {fg = gruvcrate.yellow},
    markdownItalic                = {fg = gruvcrate.none, italic = true},
    markdownItalicDelimiter       = {fg = gruvcrate.red, italic = true},
    markdownLinkDelimiter         = {fg = gruvcrate.yellow},
    markdownLinkText              = {fg = gruvcrate.red},
    markdownLinkTextDelimiter     = {fg = gruvcrate.yellow},
    markdownListMarker            = {fg = gruvcrate.red},
    markdownOrderedListMarker     = {fg = gruvcrate.red},
    markdownRule                  = {fg = gruvcrate.purple},
    markdownUrl                   = {fg = gruvcrate.blue, underline = true},
    markdownUrlDelimiter          = {fg = gruvcrate.yellow},
    markdownUrlTitleDelimiter     = {fg = gruvcrate.green}
  }
  return syntax
end

local async_load_plugin

-- Loading commons
async_load_plugin = vim.loop.new_async(vim.schedule_wrap(function ()
  gruvcrate.terminal_color()
  local syntax = gruvcrate.load_plugins()
  for group,colors in pairs(syntax) do
    gruvcrate.highlight(group,colors)
  end
  async_load_plugin:close()
end))

-- Loading Plugins
function gruvcrate.colorscheme()
  vim.api.nvim_command('hi clear')
  if vim.fn.exists('syntax_on') then
    vim.api.nvim_command('syntax reset')
  end
  vim.o.background = 'dark'
  vim.o.termguicolors = true
  vim.g.colors_name = 'gruvcrate'
  local syntax = gruvcrate.load_syntax()
  for group,colors in pairs(syntax) do
    gruvcrate.highlight(group,colors)
  end
  async_load_plugin:send()
end

gruvcrate.colorscheme()

return gruvcrate

