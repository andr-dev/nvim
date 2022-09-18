local cmp_status_ok, cmp = pcall(require, "cmp")
if not cmp_status_ok then
  error("could not pcall cmp")
  return
end

local snip_status_ok, luasnip = pcall(require, "luasnip")
if not snip_status_ok then
  error("could not pcall luasnip")
  return
end

require("luasnip/loaders/from_vscode").lazy_load()

-- from lunarvim
local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local compare = require "cmp.config.compare"

local icons = require "user.icons"

local kind_icons = icons.kind

cmp.setup {
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body) -- For `luasnip` users.
    end,
  },
  mapping = cmp.mapping.preset.insert {
    ["<C-i>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
    ["<C-k>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),

    ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
    
    ["<C-c>"] = cmp.mapping {
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    },
    -- Accept currently selected item. If none selected, `select` first item.
    -- Set `select` to `false` to only confirm explicitly selected items.
    ["<CR>"] = cmp.mapping.confirm { select = false },
    ["<Right>"] = cmp.mapping.confirm { select = false },

    ["<Tab>"] = cmp.mapping(function(fallback)
			if cmp.visible() then
				cmp.select_next_item()
			elseif luasnip.expandable() then
				luasnip.expand()
			elseif luasnip.expand_or_jumpable() then
				luasnip.expand_or_jump()
			elseif check_backspace() then
				fallback()
			else
				fallback()
			end
    end, {
      "i",
      "s",
    }),
    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, {
      "i",
      "s",
    }),
  },
  formatting = {
    fields = { "kind", "abbr", "menu" },
    format = function(entry, vim_item)
      vim_item.kind = kind_icons[vim_item.kind]
      vim_item.menu = ({
        nvim_lsp = "",
        nvim_lua = "",
        luasnip = "",
        buffer = "",
        path = "",
      })[entry.source.name]
      return vim_item
    end,
  },
  sources = {
    { name = "nvim_lsp", priority = 10 },
    { name = "nvim_lua", priority = 9 },
    { name = "luasnip",  priority = 5 },
    { name = "path",     priority = 4 },
    { name = "buffer",   priority = 3 },
  },
  sorting = {
    priority_weight = 1,
    comparators = {
      compare.locality,
      compare.score,
      compare.recently_used,
      compare.offset,
      compare.order,
    }
  },
  confirm_opts = {
    behavior = cmp.ConfirmBehavior.Replace,
    select = false,
  },
  window = {
    documentation = {
      winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    },
    completion = {
      winhighlight = "NormalFloat:Pmenu,NormalFloat:Pmenu,CursorLine:PmenuSel,Search:None",
    },
  },
  experimental = {
    ghost_text = true,
  },
}