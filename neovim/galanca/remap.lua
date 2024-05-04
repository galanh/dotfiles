-- leader key
-- let g:mapleader='\'
vim.g.mapleader = "\\"
--

-- toggle the spell checker only in normal mode
-- nnoremap <leader>s :set invspell<CR>
vim.keymap.set("n", "<leader>s", ":set invspell<CR>")
-- spell español
vim.keymap.set("n", "<leader>se", ":set spell spelllang=es<CR>")

-- Trim Trailing Whitespace in the current file
-- nnoremap <leader>b :%s/ \+$//<cr>
vim.keymap.set("n", "<leader>b", ":%s/ \\+$//<cr>")

-- Turn off highlight
vim.keymap.set("n", "<leader>nh", ":nohl<CR>")

-- window management
-- split window vertically
vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) 
-- split window horizontally
vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) 
-- close current split window
vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) 
--
-- open new tab
vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) 

-- backward when you open a directory with nvim
vim.keymap.set("n", "<leader>vp", ":Ex<CR>")



