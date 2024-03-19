local M = {
  'nvim-neotest/neotest',
  ft = { 'go', 'rust', 'python', 'cs', 'typescript', 'javascript' },
  dependencies = {
    'nvim-treesitter/nvim-treesitter',
    -- general tests
    'vim-test/vim-test',
    'nvim-neotest/neotest-vim-test',
    -- language specific tests
    'marilari88/neotest-vitest',
    'nvim-neotest/neotest-python',
    'nvim-neotest/neotest-plenary',
    'rouge8/neotest-rust',
    'lawrence-laz/neotest-zig',
    'rcasia/neotest-bash',
    'nvim-neotest/neotest-go',
    'Issafalcon/neotest-dotnet',
    'nvim-neotest/neotest-jest',
    'nvim-neotest/nvim-nio',
  },
}

function M.opts()
  return {
    -- your neotest config here
    adapters = {
      require 'neotest-dotnet',
      require 'neotest-python',
      require 'neotest-rust',
      require 'neotest-go',
      require 'neotest-jest',
    },
  }
end

function M.config(_, opts)
  local wk = require 'which-key'
  wk.register {
    ['<leader>tt'] = { "<cmd>lua require'neotest'.run.run()<cr>", 'Test Nearest' },
    ['<leader>tf'] = { "<cmd>lua require('neotest').run.run(vim.fn.expand('%'))<cr>", 'Test File' },
    ['<leader>td'] = { "<cmd>lua require('neotest').run.run({strategy = 'dap'})<cr>", 'Debug Test' },
    ['<leader>ts'] = { "<cmd>lua require('neotest').run.stop()<cr>", 'Test Stop' },
    ['<leader>ta'] = { "<cmd>lua require('neotest').run.attach()<cr>", 'Attach Test' },
  }

  ---@diagnostic disable: missing-fields
  -- require('neotest').setup {
  --   adapters = {
  --     require 'neotest-python' {
  --       dap = { justMyCode = false },
  --     },
  --     require 'neotest-vitest',
  --     require 'neotest-zig',
  --     require 'neotest-rust',
  --     require 'neotest-vim-test' {
  --       ignore_file_types = { 'python', 'vim', 'lua' },
  --     },
  --   },
  -- }
  -- get neotest namespace (api call creates or returns namespace)
  local neotest_ns = vim.api.nvim_create_namespace 'neotest'
  vim.diagnostic.config({
    virtual_text = {
      format = function(diagnostic)
        local message = diagnostic.message:gsub('\n', ' '):gsub('\t', ' '):gsub('%s+', ' '):gsub('^%s+', '')
        return message
      end,
    },
  }, neotest_ns)
  require('neotest').setup(opts)
end

return M
