local highlight = {
  "RainbowRed",
  "RainbowYellow",
  "RainbowBlue",
  "RainbowOrange",
  "RainbowGreen",
  "RainbowViolet",
  "RainbowCyan",
  "passive",
}

local hooks = require("ibl.hooks")
local scope = "focus"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
  vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
  vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
  vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
  vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
  vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
  vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
  vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
  vim.api.nvim_set_hl(0, "focus", { fg = "#ffffff" })
  vim.api.nvim_set_hl(0, "passive", { fg = "#ffffff" })
end)

return {
  "lukas-reineke/indent-blankline.nvim",
  event = "LazyFile",
  opts = function()
    LazyVim.toggle.map("<leader>ug", {
      name = "Indention Guides",
      get = function()
        return require("ibl.config").get_config(0).enabled
      end,
      set = function(state)
        require("ibl").setup_buffer(0, { enabled = state })
      end,
    })

    return {
      indent = {
        char = "│",
        tab_char = "│",
        highlight = highlight,
      },
      scope = { show_start = false, show_end = false, highlight = scope },
      exclude = {
        filetypes = {
          "help",
          "alpha",
          "dashboard",
          "neo-tree",
          "Trouble",
          "trouble",
          "lazy",
          "mason",
          "notify",
          "toggleterm",
          "lazyterm",
        },
      },
    }
  end,
  main = "ibl",
}
