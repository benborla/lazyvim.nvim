if true then
  return {}
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      -- vtsls configuration
      vtsls = {
        settings = {
          typescript = {
            format = {
              indentSize = 2,
              convertTabsToSpaces = true,
              tabSize = 2,
              singleQuote = true,
              semi = false,
              trailingComma = "all",
            },
          },
          javascript = {
            format = {
              indentSize = 2,
              convertTabsToSpaces = true,
              tabSize = 2,
              singleQuote = true,
              semi = false,
              trailingComma = "all",
            },
          },
        },
      },
    },
  },
  config = function()
    local lspconfig = require("lspconfig")

    -- Configure vtsls
    lspconfig.vtsls.setup({
      on_attach = function(client, bufnr)
        -- Enable formatting
        client.server_capabilities.documentFormattingProvider = true

        -- Set up format on save
        vim.api.nvim_create_autocmd("BufWritePre", {
          buffer = bufnr,
          callback = function()
            vim.lsp.buf.format({ async = false })
          end,
        })

        -- Log that format on save has been set up
        print("Format on save set up for buffer: " .. bufnr)
      end,
    })
    -- Add a command to manually trigger formatting
    vim.api.nvim_create_user_command("Format", function()
      vim.lsp.buf.format({ async = false })
    end, {})
  end,
}
