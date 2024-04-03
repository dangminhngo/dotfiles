vim.uv = vim.uv or vim.loop

local M = {}

function M.setup()
  require("cruxvim.config").setup()
end

return M
