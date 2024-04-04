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

---@param buf? number
---@return string[]?
function M.get_kind_filter(buf)
  local kind_filter = require("cruxvim.config.defaults").kind_filter
  buf = (buf == nil or buf == 0) and vim.api.nvim_get_current_buf() or buf
  local ft = vim.bo[buf].filetype
  if kind_filter == false then
    return
  end
  if kind_filter[ft] == false then
    return
  end
  if type(kind_filter[ft]) == "table" then
    return kind_filter[ft]
  end
  ---@diagnostic disable-next-line: return-type-mismatch
  return type(kind_filter) == "table" and type(kind_filter.default) == "table" and M.kind_filter.default or nil
end

return M
