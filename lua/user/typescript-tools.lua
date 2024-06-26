local M = {
  'pmizio/typescript-tools.nvim',
  dependencies = { 'nvim-lua/plenary.nvim', 'neovim/nvim-lspconfig' },
  opts = {},
  config = function()
    vim.keymap.set('n', '<leader>co', '<cmd>TSToolsOrganizeImports<cr>', { noremap = true, silent = true, desc = 'Organize Imports'})
    vim.keymap.set('n', '<leader>ci', '<cmd>TSToolsAddMissingImports<cr>', { noremap = true, silent = true, desc = 'Add missing Imports'})
    vim.keymap.set('n', '<leader>cr', '<cmd>TSToolsRenameFile<cr>', { noremap = true, silent = true, desc = 'Rename File'})
    require('typescript-tools').setup {
      settings = {
        -- spawn additional tsserver instance to calculate diagnostics on it
        separate_diagnostic_server = true,
        -- "change"|"insert_leave" determine when the client asks the server about diagnostic
        publish_diagnostic_on = 'insert_leave',
        -- array of strings("fix_all"|"add_missing_imports"|"remove_unused"|
        -- "remove_unused_imports"|"organize_imports") -- or string "all"
        -- to include all supported code actions
        -- specify commands exposed as code_actions
        expose_as_code_action = {},
        -- string|nil - specify a custom path to `tsserver.js` file, if this is nil or file under path
        -- not exists then standard path resolution strategy is applied
        tsserver_path = nil,
        -- specify a list of plugins to load by tsserver, e.g., for support `styled-components`
        -- (see 💅 `styled-components` support section)
        tsserver_plugins = {
          '@styled/typescript-styled-plugin',
        },
        -- this value is passed to: https://nodejs.org/api/cli.html#--max-old-space-sizesize-in-megabytes
        -- memory limit in megabytes or "auto"(basically no limit)
        tsserver_max_memory = 'auto',
        -- described below
        tsserver_format_options = {},
        tsserver_file_preferences = {},
        -- locale of all tsserver messages, supported locales you can find here:
        -- https://github.com/microsoft/TypeScript/blob/3c221fc086be52b19801f6e8d82596d04607ede6/src/compiler/utilitiesPublic.ts#L620
        tsserver_locale = 'en',
        -- mirror of VSCode's `typescript.suggest.completeFunctionCalls`
        complete_function_calls = false,
        include_completions_with_insert_text = true,
        -- CodeLens
        -- WARNING: Experimental feature also in VSCode, because it might hit performance of server.
        -- possible values: ("off"|"all"|"implementations_only"|"references_only")
        code_lens = 'off',
        -- by default code lenses are displayed on all referencable values and for some of you it can
        -- be too much this option reduce count of them by removing member references from lenses
        disable_member_code_lens = true,
        -- JSXCloseTag
        -- WARNING: it is disabled by default (maybe you configuration or distro already uses nvim-ts-autotag,
        -- that maybe have a conflict if enable this feature. )
        jsx_close_tag = {
          enable = true,
          filetypes = { 'javascriptreact', 'typescriptreact' },
        },
      },
    }
  end,
}

return M

-- local M = {
--   "pmizio/typescript-tools.nvim",
--   dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
-- }
--
-- function M.config()
--   local lspconfig = require "user.lsp"
--   require("typescript-tools").setup {
--     on_attach = function(client, bufnr)
--       lspconfig.on_attach(client, bufnr)
--       client.server_capabilities.documentFormattingProvider = false
--       client.server_capabilities.documentRangeFormattingProvider = false
--     end,
--     capabilities = lspconfig.common_capabilities(),
--     settings = {
--       -- spawn additional tsserver instance to calculate diagnostics on it
--       separate_diagnostic_server = true,
--       expose_as_code_action = "all",
--       tsserver_plugins = {
--         '@styled/typescript-styled-plugin',
--       },
--       tsserver_max_memory = "auto",
--       -- complete_function_calls = true,
--       include_completions_with_insert_text = true,
--       -- code_lens = "all",
--       -- disable_member_code_lens = true,
--
--       -- described below
--       -- tsserver_format_options = {},
--
--       tsserver_file_preferences = {
--         includeInlayParameterNameHints = "all", -- "none" | "literals" | "all";
--         includeInlayParameterNameHintsWhenArgumentMatchesName = true,
--         includeInlayFunctionParameterTypeHints = true,
--         includeInlayVariableTypeHints = true,
--         includeInlayVariableTypeHintsWhenTypeMatchesName = true,
--         includeInlayPropertyDeclarationTypeHints = true,
--         includeInlayFunctionLikeReturnTypeHints = true,
--         includeInlayEnumMemberValueHints = true,
--
--         includeCompletionsForModuleExports = true,
--         quotePreference = "auto",
--
--         -- autoImportFileExcludePatterns = { "node_modules/*", ".git/*" },
--       },
--
--       jsx_close_tag = {
--         enable = true,
--         filetypes = { "javascriptreact", "typescriptreact" },
--       },
--     },
--   }
-- end
--
-- return M
