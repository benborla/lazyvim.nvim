return {
  {
    "rmagatti/goto-preview",
    event = "BufEnter",
    -- config = true, -- necessary as per https://github.com/rmagatti/goto-preview/issues/88
    keys = {
      { "gpd", "<cmd>lua require('goto-preview').goto_preview_definition()<cr>", desc = "Preview definition" },
      {
        "gpt",
        "<cmd>lua require('goto-preview').goto_preview_type_definition()<cr>",
        desc = "Preview type definition",
      },
      { "gpi", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", desc = "Preview implementation" },
      { "gP", "<cmd>lua require('goto-preview').goto_preview_implementation()<cr>", desc = "Close preview window" },
      { "gpr", "<cmd>lua require('goto-preview').goto_preview_references()<cr>", desc = "Preview references" },
    },
    config = function()
      require("goto-preview").setup({
        width = 120,
        height = 40,
        preview_window_title = { enable = true, position = "center" },
      })
    end,
  },
}
