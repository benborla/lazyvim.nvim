return {
  {
    "phaazon/hop.nvim",
    event = "VeryLazy",
    keys = { { "<C-g>", "<cmd>HopWord<cr>", desc = "Go to text" } },
    opts = function()
      return {}
    end,
  },
}
