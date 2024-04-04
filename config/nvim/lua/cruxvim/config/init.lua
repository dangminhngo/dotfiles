_G.CruxVim = require("cruxvim.util")

local M = {}

function M.setup()
  -- autocmds can be loaded lazily when not opening a file
  local lazy_autocmds = vim.fn.argc(-1) == 0
  if lazy_autocmds then
    require("cruxvim.config.autocmds")
  end

  local group = vim.api.nvim_create_augroup("CruxVim", { clear = true })
  vim.api.nvim_create_autocmd("User", {
    group = group,
    pattern = "VeryLazy",
    callback = function()
      if lazy_autocmds then
        require("cruxvim.config.autocmds")
      end

      require("cruxvim.config.keymaps")
    end,
  })
end

M.did_init = false
function M.init()
  if M.did_init then
    return
  end

  M.did_init = true

  -- delay notifications till vim.notify was replaced or after 500ms
  CruxVim.lazy_notify()

  require("cruxvim.config.opts")
end

return M
