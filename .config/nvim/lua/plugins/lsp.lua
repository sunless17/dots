return {
  -- LSP downloader
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
    },
    opts = {
      ui = {
        icons = {
          package_installed = "✓",
          package_pending = "➜",
          package_uninstalled = "✗"
        }
      }
    },
  },
  -- LSP Support
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
    },
    config = function()
      local nvim_lsp = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")

      local protocol = require("vim.lsp.protocol")

      local on_attach = function(client, bufnr)
        -- format on save
        if client.server_capabilities.documentFormattingProvider then
          vim.api.nvim_create_autocmd("BufWritePre", {
            group = vim.api.nvim_create_augroup("Format", { clear = true }),
            buffer = bufnr,
            callback = function()
              vim.lsp.buf.format()
            end,
          })
        end
      end

      local capabilities = require("cmp_nvim_lsp").default_capabilities()

      mason_lspconfig.setup_handlers({
        -- web dev
        function(html)
          nvim_lsp[html].setup({
            capabilities = capabilities,
          })
        end,
        function(cssls)
          nvim_lsp[cssls].setup({
            capabilities = capabilities,
          })
        end,
        function(stylelint_lsp)
          nvim_lsp[stylelint_lsp].setup({
            capabilities = capabilities,
          })
        end,
        -- function(angularls)
        --     nvim_lsp[angularls].setup({
        --         capabilities = capabilities,
        --     })
        -- end,
        function(emmet_ls)
          nvim_lsp[emmet_ls].setup({
            capabilities = capabilities,
          })
        end,
        function(htmlx)
          nvim_lsp[htmlx].setup({
            capabilities = capabilities,
          })
        end,

        -- essential
        function(eslint)
          nvim_lsp[eslint].setup({
            capabilities = capabilities,
          })
        end,
        function(tsserver)
          nvim_lsp[tsserver].setup({
            capabilities = capabilities,
          })
        end,
        function(jsonls)
          nvim_lsp[jsonls].setup({
            capabilities = capabilities,
          })
        end,
        function(pyright)
          nvim_lsp[pyright].setup({
            capabilities = capabilities,
          })
        end,
        function(ansiblels)
          nvim_lsp[ansiblels].setup({
            capabilities = capabilities,
          })
        end,
        function(ansible_lint)
          nvim_lsp[ansible_lint].setup({
            capabilities = capabilities,
          })
        end,
        function(bashls)
          nvim_lsp[bashls].setup({
            capabilities = capabilities,
          })
        end,
        function(shellcheck)
          nvim_lsp[shellcheck].setup({
            capabilities = capabilities,
          })
        end,
        function(powershell_es)
          nvim_lsp[powershell_es].setup({
            capabilities = capabilities,
          })
        end,
        function(dockerls)
          nvim_lsp[dockerls].setup({
            capabilities = capabilities,
          })
        end,
        function(jdtls)
          nvim_lsp[jdtls].setup({
            capabilities = capabilities,
          })
        end,
        function(java_language_server)
          nvim_lsp[java_language_server].setup({
            capabilities = capabilities,
          })
        end,
        function(lua_ls)
          nvim_lsp[lua_ls].setup({
            capabilities = capabilities,
          })
        end,
        -- later
        function(clangd)
          nvim_lsp[clangd].setup({
            capabilities = capabilities,
          })
        end,
        function(omnisharp)
          nvim_lsp[omnisharp].setup({
            capabilities = capabilities,
          })
        end,
        function(awk_ls)
          nvim_lsp[awk_ls].setup({
            capabilities = capabilities,
          })
        end,
        function(cobol_ls)
          nvim_lsp[cobol_ls].setup({
            capabilities = capabilities,
          })
        end,
        function(ltex)
          nvim_lsp[ltex].setup({
            capabilities = capabilities,
          })
        end,
        function(rust_analyzer)
          nvim_lsp[rust_analyzer].setup({
            capabilities = capabilities,
          })
        end,
        function(marksman)
          nvim_lsp[marksman].setup({
            capabilities = capabilities,
          })
        end,
        function(sqlls)
          nvim_lsp[sqlls].setup({
            capabilities = capabilities,
          })
        end,
      })
    end,
  }
}
