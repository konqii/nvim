-- Highlight todo, notes, etc in comments
local M = {
  'folke/todo-comments.nvim',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = {
    signs = false,
  },
}

return M
