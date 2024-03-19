local M = {
  'cbochs/grapple.nvim',
  dependencies = {
    { 'nvim-tree/nvim-web-devicons', lazy = true },
  },
  opts = {
    scope = 'git', -- also try out "git_branch"
  },
  event = { 'BufReadPost', 'BufNewFile' },
  cmd = 'Grapple',
  keys = {
    { '<s-m>', '<cmd>Grapple toggle<cr>', desc = 'Grapple toggle tag' },
    { '<TAB>', '<cmd>Grapple toggle_tags<cr>', desc = 'Grapple toggle tags' },
    { '<s-TAB>', '<cmd>Grapple toggle_scopes<cr>', desc = 'Grapple toggle scopes' },
    { '<leader>1', '<cmd>Grapple select index=1<cr>', desc = 'Grapple select 1' },
    { '<leader>2', '<cmd>Grapple select index=2<cr>', desc = 'Grapple select 2' },
    { '<leader>3', '<cmd>Grapple select index=3<cr>', desc = 'Grapple select 3' },
    { '<leader>4', '<cmd>Grapple select index=4<cr>', desc = 'Grapple select 4' },
  },
}

return M
