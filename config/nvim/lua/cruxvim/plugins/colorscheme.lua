return {
  {
    dir = "~/repos/crux.nvim",
    -- "crux-theme/crux.nvim",
    lazy = false,
    priority = 1000,
    opts = {},
    config = function(_, opts)
      require("crux").setup(opts)
      vim.cmd([[colorscheme crux]])
    end,
  },
}
