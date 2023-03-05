local builtin = require('telescope.builtin')
require('telescope').load_extension('projects')
require('telescope').load_extension('session-lens')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {})
vim.keymap.set('n', '<leader>ps', builtin.live_grep, {})

