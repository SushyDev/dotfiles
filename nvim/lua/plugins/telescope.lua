-- Fuzzy Finder (files, lsp, etc)
-- See `:help telescope.builtin`

return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  config = function()
    require('telescope').setup {
      defaults = {
        mappings = {
          i = {
            ['<C-u>'] = false,
            ['<C-d>'] = false,
          },
        },
        cache_picker = {
          num_pickers = 32,
        },
        path_display = {
          'truncate',
        },
      },
    }

    -- Enable telescope fzf native, if installed
    pcall(require('telescope').load_extension('fzf'))

    -- Enable telescope tailwindcss (tailiscope)
    pcall(require('telescope').load_extension('tailiscope'))
  end,
}
