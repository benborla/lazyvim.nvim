return {
  -- Keymap "gf" on a view file
  {
    "ricardoramirezr/blade-nav.nvim",
    dependencies = {
      "hrsh7th/nvim-cmp", -- if using nvim-cmp
      { "ms-jpq/coq_nvim", branch = "coq" }, -- if using coq
    },
    ft = { "blade", "php" }, -- optional, improves startup time
  },
  {
    "jwalton512/vim-blade",
  },
}
