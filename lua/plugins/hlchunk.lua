return {
  {
    "shellRaining/hlchunk.nvim",
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("hlchunk").setup({
        chunk = {
          enable = true,
          style = {
            { fg = "#ffff22" },
            { fg = "#c21f30" },
          },
          duration = 200,
          delay = 100,
        },
      })
    end,
  },
}
