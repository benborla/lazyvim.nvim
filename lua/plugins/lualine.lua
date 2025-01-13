return {
  "nvim-lualine/lualine.nvim",
  event = "VeryLazy",
  enabled = true,
  init = function()
    vim.g.lualine_laststatus = vim.o.laststatus
    if vim.fn.argc(-1) > 0 then
      vim.o.statusline = " "
    else
      vim.o.laststatus = 0
    end
  end,
  opts = function()
    local icons = LazyVim.config.icons

    vim.o.laststatus = vim.g.lualine_laststatus

    local mode = "mode"
    local filetype = { "filetype", icon_only = false, separator = "", padding = { left = 1, right = 1 } }

    local lsp_server = {
      function()
        local buf_clients = vim.lsp.get_active_clients({ bufnr = 0 })
        if #buf_clients == 0 then
          return "No LSP"
        end

        local client_names = {}
        for _, client in ipairs(buf_clients) do
          table.insert(client_names, client.name)
        end

        return table.concat(client_names, ", ")
      end,
    }

    local is_macro_recording = {
      function()
        local reg = vim.fn.reg_recording()
        if reg == "" then
          return ""
        end

        return "[MACRO] Recording @" .. reg
      end,
    }

    local diagnostics = {
      "diagnostics",
      sources = { "nvim_diagnostic" },
      sections = { "error", "warn", "info", "hint" },
      symbols = {
        error = icons.diagnostics.Error,
        warn = icons.diagnostics.Warn,
        info = icons.diagnostics.Info,
        hint = icons.diagnostics.Hint,
      },
      colored = true,
      update_in_insert = false,
      always_visible = false,
    }
    local filename = {
      "filename",
      path = 1, -- Show relative path
      symbols = {
        modified = "[+]",
        readonly = "[]",
        unnamed = "[No Name]",
      },
    }

    local diff = {
      "diff",
      source = function()
        local gitsigns = vim.b.gitsigns_status_dict
        if gitsigns then
          return {
            added = gitsigns.added,
            modified = gitsigns.changed,
            removed = gitsigns.removed,
          }
        end
      end,
      symbols = {
        added = icons.git.added .. " ",
        modified = icons.git.modified .. " ",
        removed = icons.git.removed .. " ",
      },
      colored = true,
      always_visible = false,
    }

    local opts = {
      options = {
        theme = "gruvbox",
        globalstatus = true,
        -- component_separators = { left = "", right = "" },
        -- section_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        component_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "lazy", "ministarter", "snacks_dashboard" } },
      },
      sections = {
        lualine_a = { mode },
        lualine_b = { "branch" },
        lualine_c = { LazyVim.lualine.root_dir(), filename },
        lualine_x = {
          diff,
          diagnostics,
          filetype,
        },
        lualine_y = {
          lsp_server,
          is_macro_recording,
          { "progress", separator = " ", padding = { left = 1, right = 0 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          function()
            return " " .. os.date("%R")
          end,
        },
      },
      extensions = { "neo-tree", "lazy" },
    }

    return opts
  end,
}
