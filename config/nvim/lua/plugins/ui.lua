return {
  {
    "rcarriga/nvim-notify",
    opts = {
      timeout = 5000,
    },
  },

  -- buffer line
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<Tab>", "<Cmd>BufferLineCycleNext<CR>", desc = "Next tab" },
      { "<S-Tab>", "<Cmd>BufferLineCyclePrev<CR>", desc = "Prev tab" },
    },
    opts = {
      options = {
        mode = "tabs",
        -- separator_style = "slant",
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },

  -- statusline
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    opts = function()
      local icons = require "config.icons"
      local Util = require "lazyvim.util"

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          disabled_filetypes = { statusline = { "dashboard", "alpha" } },
        },
        sections = {
          lualine_a = { "mode" },
          lualine_b = {
            { "filename", path = 1, symbols = { modified = " 󰛿 ", readonly = "", unnamed = "" } },
          },
          lualine_c = {
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
              -- stylua: ignore
              {
                function() return require("nvim-navic").get_location() end,
                cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
              },
          },
          lualine_x = {
              -- stylua: ignore
              {
                function() return require("noice").api.status.command.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
                color = Util.ui.fg("Statement"),
              },
              -- stylua: ignore
              {
                function() return require("noice").api.status.mode.get() end,
                cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
                color = Util.ui.fg("Constant"),
              },
              -- stylua: ignore
              {
                function() return "󰃤  " .. require("dap").status() end,
                cond = function () return package.loaded["dap"] and require("dap").status() ~= "" end,
                color = Util.ui.fg("Debug"),
              },
            {
              require("lazy.status").updates,
              cond = require("lazy.status").has_updates,
              color = Util.ui.fg "Special",
            },
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
          },
          lualine_y = {
            { "progress", separator = " ", padding = { left = 1, right = 0 } },
            { "location", padding = { left = 0, right = 1 } },
          },
          lualine_z = {
            {
              "b:gitsigns_head",
              icon = "󰘬",
              color = { gui = "bold" },
            },
          },
        },
        extensions = { "neo-tree", "lazy" },
      }
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = "ZenMode",
    opts = {
      plugins = {
        gitsigns = true,
        tmux = true,
        kitty = { enabled = false, font = "+2" },
      },
    },
    keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  },

  {
    "nvimdev/dashboard-nvim",
    event = "VimEnter",
    opts = function(_, opts)
      local logo = [[
        ░▒██████   ░▒████████████████
          ░▒██████   ░▒████████████████
            ░▒██████   ░▒██████   ░▒██████
              ░▒██████   ░▒██████   ░▒██████
              ░▒██████   ░▒██████   ░▒██████
            ░▒██████   ░▒██████   ░▒██████
          ░▒██████   ░▒██████   ░▒██████
        ░▒██████   ░▒██████   ░▒██████
]]

      logo = string.rep("\n", 8) .. logo .. "\n\n"
      opts.config.header = vim.split(logo, "\n")
    end,
  },
}