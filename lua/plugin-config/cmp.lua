local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<leader>k'] = cmp.mapping.select_next_item(cmp_select),
    ['<leader>j'] = cmp.mapping.select_prev_item(cmp_select),
    ['<leader>b'] = cmp.mapping.scroll_docs(-4),
    ['<leade>f'] = cmp.mapping.scroll_docs(4),
    ['<TAB>'] = cmp.mapping.confirm({ select = true }),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 4 },
    { name = "luasnip",  priority = 3 },
    { name = "path",     priority = 2 },
    { name = "buffer",   priority = 1 },
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
})
