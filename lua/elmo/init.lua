local M = {}

-- default configs
M.config = {}

function M.setup(config)
end

M.load = function()
  if vim.version().minor < 8 then
    vim.notify_once("elmo: you must use neovim 0.8 or higher")
    return
  end

  -- reset colors
  if vim.g.colors_name then
    vim.cmd.hi("clear")
  end

  vim.g.colors_name = "elmo"
  vim.o.termguicolors = true

  local groups = require("elmo.groups").setup()

  -- add highlights
  for group, settings in pairs(groups) do
    vim.api.nvim_set_hl(0, group, settings)
  end
end

return M
