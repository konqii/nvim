local M = {
  'ThePrimeagen/harpoon',
  event = 'VeryLazy',
  dependencies = {
    { 'nvim-lua/plenary.nvim' },
  },
}

function M.config()
  local keymap = vim.keymap.set
  local opts = { noremap = true, silent = true }

  keymap('n', '<s-m>', "<cmd>lua require('user.harpoon').mark_file()<cr>", opts)
  keymap('n', '<TAB>', "<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>", opts)
  -- Quickly jump to harpooned files
  keymap('n', '<leader>1', function()
    local harpoon_ui = require 'harpoon.ui'
    harpoon_ui.nav_file(1)
  end, opts)

  keymap('n', '<leader>2', function()
    local harpoon_ui = require 'harpoon.ui'
    harpoon_ui.nav_file(2)
  end, opts)

  keymap('n', '<leader>3', function()
    local harpoon_ui = require 'harpoon.ui'
    harpoon_ui.nav_file(3)
  end, opts)

  keymap('n', '<leader>4', function()
    local harpoon_ui = require 'harpoon.ui'
    harpoon_ui.nav_file(4)
  end, opts)

  keymap('n', '<leader>5', function()
    local harpoon_ui = require 'harpoon.ui'
    harpoon_ui.nav_file(5)
  end, opts)
  vim.api.nvim_create_autocmd({ 'filetype' }, {
    pattern = 'harpoon',
    callback = function()
      vim.cmd [[highlight link HarpoonBorder TelescopeBorder]]
      -- vim.cmd [[setlocal nonumber]]
      -- vim.cmd [[highlight HarpoonWindow guibg=#313132]]
    end,
  })
end

function M.mark_file()
  require('harpoon.mark').add_file()
  vim.notify '󱡅  marked file'
end

return M
