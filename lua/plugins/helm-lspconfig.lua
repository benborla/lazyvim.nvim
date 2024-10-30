return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      helm_ls = {
        settings = {
          ["helm-ls"] = {
            yamlls = {
              path = "yaml-language-server",
            },
          },
        },
      },
    },
  },
}
