-- [[ General ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Telescope ]]
vim.keymap.set('n', '<leader>?', require('telescope.builtin').oldfiles, { desc = '[?] Find recently opened files' })
vim.keymap.set('n', '<leader><space>', require('telescope.builtin').buffers, { desc = '[ ] Find existing buffers' })

-- vim.keymap.set('n', '<leader>/', function()
--   -- You can pass additional configuration to telescope to change theme, layout, etc.
--   require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
--     winblend = 10,
--     previewer = false,
--   })
-- end, { desc = '[/] Fuzzily search in current buffer' })

vim.keymap.set('n', '<leader>gf', require('telescope.builtin').git_files, { desc = 'Search [G]it [F]iles' })
vim.keymap.set('n', '<leader>sf', require('telescope.builtin').find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>sh', require('telescope.builtin').help_tags, { desc = '[S]earch [H]elp' })
vim.keymap.set('n', '<leader>sw', require('telescope.builtin').grep_string, { desc = '[S]earch current [W]ord' })
vim.keymap.set('n', '<leader>sg', require('telescope.builtin').live_grep, { desc = '[S]earch by [G]rep' })
vim.keymap.set('n', '<leader>sd', require('telescope.builtin').diagnostics, { desc = '[S]earch [D]iagnostics' })

local all_files = { additional_args = { '-uu' } }
vim.keymap.set('n', '<leader>sag', function()
  require('telescope.builtin').live_grep(all_files)
end, { desc = '[S]earch [A]ll [G]rep' })

-- Search for files in the vendor directory
local vendor_files = { search_dirs = { 'vendor' } }
vim.keymap.set('n', '<leader>svf', function()
  require('telescope.builtin').find_files(vendor_files)
end, { desc = '[S]earch [V]endor [F]iles' })

-- Search for files in the vendor directory
local vendor_grep = { search_dirs = { 'vendor' }, additional_args = { '-uu' } }
vim.keymap.set('n', '<leader>svg', function()
  require('telescope.builtin').live_grep(vendor_grep)
end, { desc = '[S]earch [V]endor [G]rep' })

-- [[ Resizing ]]
-- Use M-(hjkl) to resize with increments of 5

vim.keymap.set('n', '<M-h>', '5<C-w><', { silent = true })
vim.keymap.set('n', '<M-j>', '5<C-w>-', { silent = true })
vim.keymap.set('n', '<M-k>', '5<C-w>+', { silent = true })
vim.keymap.set('n', '<M-l>', '5<C-w>>', { silent = true })

-- Diagnostic keymaps
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
-- vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
-- vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })
