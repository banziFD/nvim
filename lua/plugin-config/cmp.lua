local cmp = require("cmp")
local luasnip = require("luasnip")

cmp.setup({
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.select_next_item(cmp_select),
    ['<C-j>'] = cmp.mapping.select_prev_item(cmp_select),
    ['C-b'] = cmp.mapping.scroll_docs(-4),
    ['C-f'] = cmp.mapping.scroll_docs(4),
    ['<TAB>'] = cmp.mapping.confirm({ select = true }),
    ['<C-Space>'] = cmp.mapping.complete(),
  }),
  sources = cmp.config.sources({
    { name = "nvim_lsp", priority = 4 },
    { name = "luasnip", priority = 3 },
    { name = "path", priority = 2 },
    { name = "buffer", priority = 1 },
  }),
  snippet = {
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
})





