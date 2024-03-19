local M = {
  "nvim-lualine/lualine.nvim",
  -- dependencies = {
  --   "AndreM222/copilot-lualine",
  -- },
}

function M.config()
  local icons = require "user.icons"

  local diagnostics = {
    "diagnostics",
    sections = { "error", "warn" },
    colored = true, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
    color = { bg = "#000" },
  }

  local progress = {
    "progress",
    sections = { "progress" },
    colored = true, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
    color = { bg = "#000" },
  }

  local encoding = {
    "encoding",
    sections = { "encoding" },
    colored = true, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
    color = { bg = "#000" },
  }

  local fileformat= {
    "fileformat",
    sections = { "fileformat" },
    colored = true, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
    color = { bg = "#000" },
  }

  local filetype= {
    "filetype",
    sections = { "filetype" },
    colored = true, -- Displays diagnostics status in color if set to true.
    always_visible = true, -- Show diagnostics even if there are none.
    color = { bg = "#000" },
  }

  require("lualine").setup {
    options = {
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },

      ignore_focus = { "NvimTree" },
      theme = {
        normal = {
          a = {
            bg = "#000"
          },
          b = {
            bg = "#000"
          },
          c = {
            bg = "#000"
          },
        }
      }
    },
    sections = {
      -- lualine_a = { {"branch", icon =""} },
      -- lualine_b = { diff },
      -- lualine_c = { "diagnostics" },
      -- lualine_x = { copilot },
      -- lualine_y = { "filetype" },
      -- lualine_z = { "progress" },
      -- lualine_a = { "mode" },
      -- lualine_a = {},
      lualine_a = { },
      lualine_c = { diagnostics },
      -- lualine_x = { diff, "copilot", filetype },
      -- lualine_x = { "copilot", filetype },
      -- lualine_x = { {sections = { "fileformat" }, color = { bg = "#000"} } },
      lualine_x = { encoding, fileformat, filetype },
      lualine_y = { progress },
      lualine_z = { {color = { bg = "#000"} } },
    },
    -- extensions = { "quickfix", "man", "fugitive", "oil" },
    extensions = { "quickfix", "man", "fugitive" },
  }
end

return M
