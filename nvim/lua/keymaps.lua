vim.keymap.set('n', '<leader>sag', function()
  require('telescope.builtin').live_grep({
    additional_args = { '-uu' },
  })
end, { desc = '[S]earch [A]ll [G]rep' })

-- Search for files in the vendor directory
vim.keymap.set('n', '<leader>svf', function()
  require('telescope.builtin').find_files({
    search_dirs = { 'vendor' },
  })
end, { desc = '[S]earch [V]endor [F]iles' })

vim.keymap.set('n', '<leader>svg', function()
  require('telescope.builtin').live_grep({
    search_dirs = { 'vendor' },
    additional_args = { '-uu' },
  })
end, { desc = '[S]earch [V]endor [G]rep' })

