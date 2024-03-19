local M = {
  "kylechui/nvim-surround",
  event = "VeryLazy",
}

function M.config()
  require("nvim-surround").setup {
    keymaps = { -- vim-surround style keymaps
      insert = "<C-g>s",
      insert_line = "<C-g>S",
      normal = "cs",
      normal_cur = "css",
      normal_line = "cS",
      normal_cur_line = "SS",
      visual = "s",
      visual_line = "gS",
      delete = "ds",
      change = "cs",
    },
  }

  vim.cmd [[nmap <leader>' siw']]
end

return M
