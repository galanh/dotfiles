-- Hay que pensar sistemicamente en una clasiicacion:
-- See `:help vim.opt`
-- NOTE: You can change these options as you wish! 

-- Make line numbers default
vim.opt.number = true

-- Remove this option if you want your OS clipboard to remain independent
vim.opt.clipboard = 'unnamedplus'

-- Enable break indent
vim.opt.breakindent = true

-- Save undo history
vim.opt.undofile = true

-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Enable spell checking globally and sets the default language to Spanish
vim.opt.spell = false
vim.opt.spelllang = 'es'

