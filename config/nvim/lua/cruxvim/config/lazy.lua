local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  spec = {
    { import = "cruxvim.plugins" },
    -- extras plugins go here
    { import = "cruxvim.plugins.extras.ui.mini-hipatterns" },
    -- { import = "cruxvim.plugins.extras.coding.copilot" },
    -- { import = "cruxvim.plugins.extras.coding.dap" },
    { import = "cruxvim.plugins.extras.format.prettier" },
    { import = "cruxvim.plugins.extras.lint.eslint" },

    { import = "cruxvim.plugins.extras.lang.docker" },
    { import = "cruxvim.plugins.extras.lang.json" },
    { import = "cruxvim.plugins.extras.lang.markdown" },
    { import = "cruxvim.plugins.extras.lang.prisma" },
    { import = "cruxvim.plugins.extras.lang.python" },
    { import = "cruxvim.plugins.extras.lang.rust" },
    { import = "cruxvim.plugins.extras.lang.tailwind" },
    { import = "cruxvim.plugins.extras.lang.typescript" },
    { import = "cruxvim.plugins.extras.lang.vue" },
    { import = "cruxvim.plugins.extras.lang.yaml" },
  },
  defaults = {
    lazy = false,
    version = false,
  },
  install = { colorscheme = { "crux" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        -- "matchit",
        -- "matchparen",
        -- "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})
