require("mason").setup()

local servers = {
  "clangd",
  "cmake",
  "rust_analyzer",
  "gopls",
  "bashls",
  "pyright",
  "tsserver",
  "html",
  "cssls",
  "jsonls",
  "eslint",
  "yamlls",
  "dockerls",
  "docker_compose_language_service",
}

require("mason-lspconfig").setup({
  ensure_installed = servers
})

local mason_null_ls = require("mason-null-ls")
mason_null_ls.setup({
  ensure_installed = {
    "prettierd",
    "beautysh",
    "autopep8",
    "clang-format",
  }
})


local on_attach = function(client, bufnr)
  local opts = { noremap = true, silent = true, buffer = bufnr}
  vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts) vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
  vim.keymap.set('n', 'gD', function()
    vim.cmd([[vsplit]])
    vim.lsp.buf.definition()
  end, opts)
  vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, opts)
  vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, opts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
  vim.keymap.set('n', '<leader>fm', function()
    vim.lsp.buf.format({ 
      async = true, 
      filter = function(client)
        return client.name == "null-ls"
      end
    })
  end, opts)

  if client.name == "tsserver" then 
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
  end

end

local capabilities = require("cmp_nvim_lsp").default_capabilities()
local lspconfig = require("lspconfig")
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    capabilities = capabilities,
    on_attach = on_attach
  }
end

local null_ls = require("null-ls")
local formatting = null_ls.builtins.formatting
local diagnostics = null_ls.builtins.diagnostics
local augroup = vim.api.nvim_create_augroup("LspFormatting", { })

null_ls.setup({
  sources = {
    formatting.prettierd,
    formatting.beautysh,
    formatting.autopep8,
    formatting.clang_format.with({
      filetypes = {"c", "cpp", "h", "cc" },
    }),
    diagnostics.eslint_d.with({
      condition = function(utils)
        return utils.root_has_file('.eslintrc.json')
      end
    })
  },
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format({
                async = true,
                filter = function(client)
                  return client.name == 'null-ls'
                end
              })
            end,
        })
    end
  end,

})



