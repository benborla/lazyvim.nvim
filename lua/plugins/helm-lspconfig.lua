return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      helm_ls = {
        filetypes = { "helm", "yaml", "yml" },
        settings = {
          ["helm-ls"] = {
            yamlls = {
              path = "yaml-language-server",
            },
            formatMode = "helm",
          },
        },
      },
    },
  },
}
