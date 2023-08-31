-- Set lualine as statusline
-- See `:help lualine.txt`

return {
  'nvim-lualine/lualine.nvim',
  config = function ()
    -- Set transparent background color
    local theme_custom = require('lualine.themes.auto')
    theme_custom.normal.c.bg = 'none'

    require('lualine').setup {
      options = {
        icons_enabled = false,
        theme = theme_custom,
        component_separators = { left = '|', right = '|' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = { 'netrw' },
      }
    }
  end
}
