-- Set lualine as statusline
-- See `:help lualine.txt`

return {
  'nvim-lualine/lualine.nvim',
  opts = {
    options = {
      icons_enabled = false,
      component_separators = '|',
      section_separators = '',
    },
  },
  config = function ()
    -- Set transparent background color
    local auto_theme_custom = require('lualine.themes.auto')
    auto_theme_custom.normal.c.bg = 'none'

    require('lualine').setup {
      options = {
        theme = auto_theme_custom,
      }
    }
  end
}
