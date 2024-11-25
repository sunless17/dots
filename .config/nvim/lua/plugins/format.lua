return {
  "stevearc/conform.nvim",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local conform = require("conform")

    conform.setup({
      formatters_by_ft = {
        javascript = { "prettierd", "prettier", stop_after_first = true },
        typescript = { "prettierd", "prettier", stop_after_first = true },
        css = { "prettier" },
        bash = { "shellharden" },
        html = { "prettier" },
        json = { "prettier" },
        yaml = { "yamlfmt" },
        sql = { "sql-formatter" },
        markdown = { "markdownlint", "mdformat", stop_after_first = true },
        latex = { "latexindent" },
        lua = { "stylua" },
        c = { "clang-format" },
        python = { "isort" },
        java = { "google-java-format" },
      },
      -- format_on_save = {
      --   lsp_fallback = true,
      --   async = false,
      --   timeout_ms = 1000,
      -- },
    })

    vim.keymap.set({ "n", "v" }, "<leader>f", function()
      conform.format({
        lsp_fallback = true,
        async = false,
        timeout_ms = 1000,
      })
    end, { desc = "Format file or range (in visual mode)" })
  end,
}
