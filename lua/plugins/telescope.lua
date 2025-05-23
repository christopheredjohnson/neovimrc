return {
  'nvim-telescope/telescope.nvim',
  tag = '0.1.8',
  -- or                              , branch = '0.1.x',
  dependencies = { 'nvim-lua/plenary.nvim' },
  init = function()
    local builtin = require('telescope.builtin')
    vim.keymap.set('n', '<C-f>', builtin.find_files, { desc = "Telescope find files (Git)" })
    vim.keymap.set('n', '<C-p>', builtin.git_files, { desc = "Telescope find files (Git)" })
  end
}
