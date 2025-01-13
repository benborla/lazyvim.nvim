local util = require("conform.util")
return {
  "stevearc/conform.nvim",
  opts = function()
    ---@type conform.setupopts
    local opts = {
      default_format_opts = {
        timeout_ms = 3000,
        async = false,
        quiet = false,
        lsp_format = "fallback",
      },
      formatters_by_ft = {
        lua = { "stylua" },
        fish = { "fish_indent" },
        sh = { "shfmt" },
        php = { "pint", "php-cs-fixer" },
        blade = { "blade-formatter", "rustywind" },
        python = { "black" },
        javascript = { "eslint_d" },
        typescript = { "eslint_d" },
        javascriptreact = { "eslint_d" },
        typescriptreact = { "eslint_d" },
        css = { "eslint_d" },
        scss = { "eslint_d" },
        html = { "eslint_d" },
        yaml = { "helm_ls", "prettier" },
        yml = { "helm_ls", "prettier" },
      },
      formatters = {
        injected = { options = { ignore_errors = true } },
        pint = {
          meta = {
            url = "https://github.com/laravel/pint",
            description = "Laravel Pint is an opinionated PHP code style fixer for minimalists. Pint is built on top of PHP-CS-Fixer and makes it simple to ensure that your code style stays clean and consistent.",
          },
          command = util.find_executable({
            vim.fn.stdpath("data") .. "/mason/bin/pint",
            "vendor/bin/pint",
          }, "pint"),
          args = { "$FILENAME" },
          stdin = false,
        },
        helm_ls = {
          command = vim.fn.expand("~/go/bin/helm-ls"),
          args = { "format" },
          stdin = false,
        },
      },
    }
    return opts
  end,
}
