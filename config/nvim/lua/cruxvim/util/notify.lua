local M = {}

function M.warn(text, opts)
  vim.notify(text, vim.log.levels.WARN, opts)
end

function M.error(text, opts)
  vim.notify(text, vim.log.levels.ERROR, opts)
end

function M.info(text, opts)
  vim.notify(text, vim.log.levels.INFO, opts)
end

function M.trace(text, opts)
  vim.notify(text, vim.log.levels.TRACE, opts)
end

function M.debug(text, opts)
  vim.notify(text, vim.log.levels.DEBUG, opts)
end

return M
